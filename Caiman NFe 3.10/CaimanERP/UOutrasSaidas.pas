unit UOutrasSaidas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, ImgList, ComCtrls, ToolWin, ExtCtrls, StdCtrls, Mask, 
  Buttons, Grids, DBGrids, DB, rxToolEdit, rxCurrEdit, UNovosComponentes, 
  UNovoFormulario, cxGraphics, cxControls, cxLookAndFeels, 
  cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, dxSkinMetropolisDark, 
  dxSkinOffice2013White, dxSkinsdxStatusBarPainter, acAlphaImageList, 
  dxStatusBar, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton, System.ImageList;

type
  TFrmOutrasSaidas = class(TFrmCadastroNovo)
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    EdtCodigo: UNovosComponentes.TEdit;
    Label2: TLabel;
    Label21: TLabel;
    EdtCodcli: UNovosComponentes.TEdit;
    BtnConsCli: TsSpeedButton;
    BtnAddCli: TsSpeedButton;
    EdtNomecli: TEdit;
    Label22: TLabel;
    EdtData: TMaskEdit;
    EdtTotal: TCurrencyEdit;
    Label17: TLabel;
    EdtCodPro: UNovosComponentes.TEdit;
    BtnConsPro: TsSpeedButton;
    BtnAddPro: TsSpeedButton;
    EdtNomePro: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    EdtQuant: TCurrencyEdit;
    Label20: TLabel;
    EdtValorUnit: TCurrencyEdit;
    Label24: TLabel;
    EdtTotalProd: TCurrencyEdit;
    BtnGrava: TBitBtn;
    BtnExclui: TBitBtn;
    DBGrid1: TDBGrid;
    Label30: TLabel;
    QBuscaItens: TFDQuery;
    DSQBuscaItens: TDataSource;
    IBTROS: TFDTransaction;
    IBSQLOS: TFDQuery;
    Label3: TLabel;
    EdtCodTipo: UNovosComponentes.TEdit;
    BtnConsTipo: TsSpeedButton;
    BtnAddTipo: TsSpeedButton;
    EdtNomeTipo: TEdit;
    GroupBox1: TGroupBox;
    QBuscaItensCOD_OUTRA: TIntegerField;
    QBuscaItensCOD_PRO: TIntegerField;
    QBuscaItensVALOR_ITEM: TBCDField;
    QBuscaItensCOD_EMP: TIntegerField;
    QBuscaItensQUANT_ITEM: TBCDField;
    QBuscaItensNOME_PRO: TStringField;
    QBuscaItensDESCRICAO: TStringField;
    QBuscaItensCALC_TOTAL: TCurrencyField;
    QOrdem: TFDQuery;
    QOrdemORDEM: TIntegerField;
    QBuscaItensVALOR_CUSTO: TBCDField;
    QBuscaItensORDEM: TIntegerField;
    ToolButton1: TToolButton;
    BtnFinaliza: TToolButton;
    Label9: TLabel;
    EdtEstoque: TCurrencyEdit;
    Label46: TLabel;
    EdtCodGRP: UNovosComponentes.TEdit;
    BtnConsGRP: TsSpeedButton;
    BtnAddGRP: TsSpeedButton;
    EdtNomeGRP: TEdit;
    Label47: TLabel;
    Label26: TLabel;
    EdtCST: TEdit;
    Label27: TLabel;
    EdtAliqICMS: TCurrencyEdit;
    Label41: TLabel;
    EdtAliqIPI: TCurrencyEdit;
    Label63: TLabel;
    EdtBCR: TCurrencyEdit;
    QBuscaItensCANCELADO: TIntegerField;
    QBuscaItensCFOP: TIntegerField;
    QBuscaItensCOD_GRP: TIntegerField;
    QBuscaItensCST: TStringField;
    QBuscaItensALIQ_ICMS: TBCDField;
    QBuscaItensREDUCAO_ICMS: TBCDField;
    QBuscaItensIPI: TBCDField;
    QBuscaItensCODIGO_LOCAL_ESTOQUE: TIntegerField;
    procedure BtnConsCliClick(Sender: TObject);
    procedure BtnAddCliClick(Sender: TObject);
    procedure EdtDataExit(Sender: TObject);
    procedure EdtCodcliKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodcliExit(Sender: TObject);
    procedure Botoes(acao : string);
    procedure LimpaItens;
    procedure QBuscaItensCalcFields(DataSet: TDataSet);
    procedure BuscaItens;
    procedure BtnConsProClick(Sender: TObject);
    procedure BtnAddProClick(Sender: TObject);
    procedure EdtCodProEnter(Sender: TObject);
    procedure EdtCodProExit(Sender: TObject);
    procedure EdtCodProKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
    procedure BtnExcluiClick(Sender: TObject);
    procedure EdtQuantExit(Sender: TObject);
    procedure EdtValorUnitExit(Sender: TObject);
    procedure BtnAddTipoClick(Sender: TObject);
    procedure BtnConsTipoClick(Sender: TObject);
    procedure EdtCodTipoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodTipoExit(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtCodcliEnter(Sender: TObject);
    procedure EdtCodTipoEnter(Sender: TObject);
    procedure EdtCodcliKeyPress(Sender: TObject; var Key: Char);
    function  Ordem : integer;
    procedure BuscaCFOP;
    procedure BtnFinalizaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    function  PrecoVenda : boolean;
    procedure FormCreate(Sender: TObject);
    procedure BtnAddGRPClick(Sender: TObject);
    procedure BtnConsGRPClick(Sender: TObject);
    procedure EdtCodGRPEnter(Sender: TObject);
    procedure EdtCodGRPExit(Sender: TObject);
    procedure EdtCodGRPKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function  BuscaLocalEstoque : integer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmOutrasSaidas: TFrmOutrasSaidas;
  bPrecoVenda  : boolean;

implementation
uses
  Udm, Ubibli1, UConsCli, UCadCli, UConsProd, UCadProduto, UCadTipoES, 
  UConsTipoES, UConsOutrasSaidas, UDadosNotaFiscal, UCadGICMS, UConsGRP, 
  UConsCFOP, UNovoPrincipal, UPrincipal;
var  bGrava         : boolean;
     bSaidaAberta   : boolean;
     iOrdem         : integer;
     bGravaItem     : boolean;
     iCFOPTrib      : integer;
     iCFOPSub       : integer;
     iGrpIcmsEsp    : integer;
     iLocalEstoque  : integer;

{$R *.dfm}

function TFrmOutrasSaidas.BuscaLocalEstoque : integer;
begin
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with dm.QConsulta do
      begin
         close;
         sql.Clear;
         sql.Text:= 'SELECT CODIGO_LOCAL_ESTOQUE ' +
                    'FROM TIPO_ES ' +
                    'WHERE COD_ES = :CODES';
         Parambyname('codes').AsInteger:= strtoint(edtcodtipo.Text);
         open;
         Result:= fieldbyname('codigo_local_estoque').AsInteger;
      end;
   dm.IBTransaction.Commit;
   dm.QConsulta.Close;
end;

function TFrmOutrasSaidas.PrecoVenda : boolean;
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
             sql.Text:= 'SELECT TIPO_PRECO ' +
                        'FROM TIPO_ES ' +
                        'WHERE COD_ES = :CODES';
             Parambyname('codes').AsInteger:= StrToInt(EdtCodTipo.text);
             open;
             if trim(fieldbyname('tipo_preco').AsString) = 'V' then
                result:= true
             else
                result:= false;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       Result:= false;
       AlertaCad('erro ao buscar o tipo de preço');
     end;
   finally
     dm.QConsulta.Close;
   end;
end;

procedure TFrmOutrasSaidas.BuscaCFOP;
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
             sql.Text:= 'SELECT CFOP_ESTADO_TRIBUTADO, CFOP_ESTADO_SUBSTITUICAO, ' +
                        'CFOP_FORA_TRIBUTADO, CFOP_FORA_SUBSTITUICAO, COD_GRP_ESPECIFICO ' +
                        'FROM TIPO_ES ' +
                        'WHERE COD_ES = :COD';
             Parambyname('cod').AsInteger:= strtoint(EdtCodTipo.Text);
             open;

             iGrpIcmsEsp:= fieldbyname('cod_grp_especifico').AsInteger;

             if bNoEstado then
                begin
                   iCFOPTrib := fieldbyname('cfop_estado_tributado').AsInteger;
                   iCFOPSub  := fieldbyname('cfop_estado_substituicao').AsInteger;
                end
             else
                begin
                   iCFOPTrib := fieldbyname('cfop_fora_tributado').AsInteger;
                   iCFOPSub  := fieldbyname('cfop_fora_substituicao').AsInteger;
                end;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar o CFOP');
     end;
   finally
     dm.QConsulta.Close;
   end;
end;

procedure TFrmOutrasSaidas.BuscaItens;
var cTotal: currency;
begin
   cTotal:= 0;
   if IBTROS.Active then
      IBTROS.Commit;
   IBTROS.StartTransaction;
   with QBuscaItens do
      begin
         close;
         Parambyname('cod').AsInteger:= strtoint(EdtCodigo.Text);
         open;
         first;
         while not eof do
            begin
               CTotal:= CTotal + QBuscaItensCALC_TOTAL.AsCurrency;
               next;
            end;
         EdtTotal.Text:= currtostr(cTotal);
      end;
end;

procedure TFrmOutrasSaidas.LimpaItens;
begin
   edtcodpro.Clear;
   edtnomepro.Clear;
   edtquant.Text:= '1';
   EdtValorUnit.Clear;
   EdtTotalProd.Clear;
   EdtEstoque.Clear;
   EdtCodGRP.clear;
   EdtNomeGRP.clear;
   EdtCST.clear;
   EdtAliqICMS.Clear;
   EdtBCR.Clear;
   EdtAliqIPI.Clear;
end;

procedure TFrmOutrasSaidas.Botoes(acao : string);
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
                Limpaedit(FrmOutrasSaidas);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin
         if not (acao = 'G') then
            Limpaedit(FrmOutrasSaidas);
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

procedure TFrmOutrasSaidas.BtnConsCliClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsCli, FrmConsCli);
  FrmConsCli.tag:= 15;
  FrmConsCli.showmodal;
end;

procedure TFrmOutrasSaidas.BtnAddCliClick(Sender: TObject);
begin
  inherited;
  BuscaFormulario( TFrmCadCli, True );
end;

procedure TFrmOutrasSaidas.EdtDataExit(Sender: TObject);
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

procedure TFrmOutrasSaidas.EdtCodcliKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = vk_f3 then
     BtnConsCli.Click
  else
     if key = vk_f2 then
        BtnAddCli.Click;
end;

procedure TFrmOutrasSaidas.EdtCodcliExit(Sender: TObject);
var sEstCliente : string;
    sUFEmpresa  : string;
begin
  inherited;
  EdtNomecli.Text:= consulta('cliente', edtcodcli, 'cod_cli', 'nome_cli', dm.IBTransaction, dm.qConsulta);
  if trim(edtnomecli.Text) = '' then
     begin
        AlertaCad('Cliente não Cadastrado');
//        edtcodcli.SetFocus;
     end
  else
     begin
        sUFEmpresa  := dm.RetornaStringTabela('est_emp', 'empresa', 'cod_emp', iEmp);
        sEstCliente := dm.RetornaStringTabela('estres_cli', 'cliente', 'cod_cli', strtoint(edtcodcli.text));
        if trim(sUFEmpresa) = trim(sEstCliente) then
           bNoEstado:= true
        else
           bNoEstado:= false;
     end;
end;

procedure TFrmOutrasSaidas.QBuscaItensCalcFields(DataSet: TDataSet);
begin
  inherited;
  QBuscaItensCALC_TOTAL.AsCurrency:= QBuscaItensVALOR_ITEM.AsCurrency * QBuscaItensQUANT_ITEM.AsCurrency;
end;

procedure TFrmOutrasSaidas.BtnConsProClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsProd, FrmConsProd);
  FrmConsProd.tag:= 9;
  FrmConsProd.showmodal;
end;

procedure TFrmOutrasSaidas.BtnAddProClick(Sender: TObject);
begin
  inherited;
  BuscaFormulario( TFrmCadProduto, True );
end;

procedure TFrmOutrasSaidas.EdtCodProEnter(Sender: TObject);
begin
  inherited;
  edtcodpro.SelectAll;
end;

procedure TFrmOutrasSaidas.EdtCodProExit(Sender: TObject);
var bAux : boolean;
begin
  inherited;
  if (DBGrid1.Focused) or (ToolBar1.focused) then
      exit;

  bAux:= false;

  if (DBGrid1.Focused) or (ToolBar1.Focused) then
     begin
        exit;
        abort;
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
            sql.Add('SELECT COD_PRO, NOME_PRO, VALOR_PRO, PRECO_CUSTO, CST_CF_EST, ' +
                    'CST_CF_FORA, ICMS_CF_EST, ICMS_CF_FORA, RED_CF_EST,           ' +
                    'RED_CF_FORA, RED_CF_EST, RED_CF_FORA                          ' +
                    'FROM PRODUTO ');

            if Length(Trim(EdtCodPro.text)) > 7 then
               sql.add(' WHERE CODIGO_BARRA_PRO = ' + #39 + trim(EdtCodPro.Text) + #39)
            else
               begin
                  sql.Add(' WHERE COD_PRO = :CODPRO');
                  Parambyname('codpro').AsInteger:= strtoint(EdtCodPro.text);
               end;

            Open;

            if not (fieldbyname('cod_pro').IsNull) then
               begin
                   bAux:= true;
                   EdtCodPro.Text  := fieldbyname('cod_pro').AsString;
                   EdtNomePro.Text := fieldbyname('nome_pro').AsString;

                   if bPrecoVenda then
                      edtvalorunit.Text := fieldbyname('valor_pro').AsString
                   else
                      edtvalorunit.Text := fieldbyname('preco_custo').AsString;

                   if bNoEstado then
                      begin
                         if iGrpIcmsEsp > 0 then
                            EdtCodGRP.Text := inttostr(iGrpIcmsEsp)
                         else
                            EdtCodGRP.Text := fieldbyname('icms_cf_est').AsString;
                         EdtCST.Text       := fieldbyname('cst_cf_est').AsString;
                         EdtBCR.Text       := fieldbyname('red_cf_est').AsString;
                      end
                   else
                      begin
                         if iGrpIcmsEsp > 0 then
                            EdtCodGRP.Text := inttostr(iGrpIcmsEsp)
                         else
                            EdtCodGRP.Text := fieldbyname('icms_cf_fora').AsString;
                         EdtCST.Text       := fieldbyname('cst_cf_fora').AsString;
                         EdtBCR.Text       := fieldbyname('red_cf_fora').AsString;
                      end;
               end
            else
               begin
                  bAux:= false;
                  AlertaCad('Produto não Cadastrado');
                  edtnomepro.Clear;
                  EdtEstoque.Clear;
//                  edtcodpro.SetFocus;
               end;
         end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      bAux:= false;
      AlertaCad('Erro ao Buscar o Produto');
      edtnomepro.Clear;
//      edtcodpro.SetFocus;
    end;
  finally
    dm.Consulta.Close;
  end;

  if bAux then
     EdtEstoque.Text:= currtostr(dm.BuscaEstoqueProduto(strtoint(EdtCodPro.Text), iEmp));
end;

procedure TFrmOutrasSaidas.EdtCodProKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = vk_f3 then
     BtnConsPro.Click
  else
     if key = vk_f2 then
        BtnAddPro.Click;
end;

procedure TFrmOutrasSaidas.BtnGravarClick(Sender: TObject);
begin
  inherited;
  if (bGrava) and (not DM.Acesso('M013','I')) then
     begin
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  if edtcodCli.Text = '' then
     begin
        AlertaCad('Digite o Código do Cliente');
//        EdtCodcli.SetFocus;
        exit;
     end;

  if IBTROS.Active then
     IBTROS.Commit;
  IBTROS.StartTransaction;
  try
    try
      with IBSQLOS do
         begin
            close;
            sql.Clear;
            if bGrava = true then
               begin
                  sql.Add('INSERT INTO OUTRAS_SAIDAS (COD_OUTRA, DATA_OUTRA, COD_ES, COD_CLI, COD_EMP, CANCELADA) ' +
                          'VALUES(:CODOUTRA, :DATAOUTRA, :CODES, :CODCLI, :CODEMP, 0)');
                  edtcodigo.Text:= inttostr(prxcod('outras_saidas', 'cod_outra', dm.IBTransaction, dm.ibsqlcod));
                  Parambyname('codemp').AsInteger:= iEmp;
               end
            else
               sql.Add('UPDATE OUTRAS_SAIDAS SET DATA_OUTRA = :DATAOUTRA, COD_ES = :CODES, COD_CLI = :CODCLI ' +
                       'WHERE COD_OUTRA = :CODOUTRA');
            Parambyname('codoutra').AsInteger      := StrToInt(EdtCodigo.Text);
            Parambyname('dataoutra').AsDate        := strtodate(EdtData.Text);
            Parambyname('codes').AsInteger         := strtoint(EdtCodTipo.Text);
            Parambyname('codcli').AsInteger        := strtoint(EdtCodcli.Text);
            ExecOrOpen;
         end;
      IBTROS.Commit;
      bSaidaAberta:= true;
      Botoes('G');
      panel3.Enabled:= false;
      panel4.Enabled:= true;
      EdtCodPro.SetFocus;
    except
      IBTROS.Rollback;
      bSaidaAberta:= false;
      AlertaCad('Erro ao Gravar o Lançamento');
      panel3.Enabled:= true;
      panel4.Enabled:= false;
    end;
  finally
     IBSQLOS.Close;
     bPrecoVenda:= PrecoVenda;
     BuscaCFOP;
     iLocalEstoque:= BuscaLocalEstoque;
     BuscaItens;
  end;
end;

procedure TFrmOutrasSaidas.BtnNovoClick(Sender: TObject);
begin
  inherited;
  ToolBar1.SetFocus;

  if bSaidaAberta then
     begin
        AlertaCad('Outras Saídas Aberta');
        exit;
     end;


  if IBTROS.Active then
     IBTROS.Commit;
  QBuscaItens.Close;
  bGrava     := true;
  bGravaItem := true;
  if not DM.Acesso('M013','I') then
     begin
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        panel3.Enabled:= false;
        panel4.Enabled:= false;
        Abort;
        Exit;
     end;
  Botoes('N');
  panel3.Enabled     := true;
  panel4.Enabled     := false;
  EdtData.Text       := datetostr(date);
  iLocalEstoque      := 0;
  Edtdata.SetFocus;
end;

procedure TFrmOutrasSaidas.BtnCancelarClick(Sender: TObject);
begin
  inherited;
  ToolBar1.SetFocus;
  if not panel3.Enabled then
     AlertaCad('Lançamento gravado')
  else
     begin
        bSaidaAberta:= false;
        Botoes('C');
        panel3.Enabled:= false;
        panel4.Enabled:= false;
     end;
end;

procedure TFrmOutrasSaidas.BtnAlterarClick(Sender: TObject);
begin
  inherited;
  if not DM.Acesso('M013','A') then
     begin
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  bGrava:= false;
  panel3.Enabled     := true;
  Botoes('A');
  edtdata.SetFocus;
end;

procedure TFrmOutrasSaidas.BtnExcluirClick(Sender: TObject);
begin
  inherited;
  ToolBar1.SetFocus;
  if not DM.Acesso('M013','E') then
     begin
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  if Application.MessageBox('Confirma a Exclusão do Acerto?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
     begin
        if IBTROS.Active then
           IBTROS.Commit;
        QBuscaItens.Close;
        IBTROS.StartTransaction;
        try
          try
            with IBSQLOS do
               begin
                  close;
                  sql.Clear;
                  sql.Add('DELETE FROM OUTRAS_SAIDAS WHERE COD_OUTRA = :CODOUTRA');
                  Parambyname('codoutra').AsInteger:= strtoint(EdtCodigo.Text);
                  ExecOrOpen;
               end;
            IBTROS.Commit;
            panel3.Enabled:= false;
            panel4.Enabled:= false;
            bSaidaAberta:= false;
            Botoes('E');
          except
            IBTROS.Rollback;
            bSaidaAberta:= true;
            AlertaCad('Erro ao Excluir o Lançamento');
          end;
        finally
          IBSQLOS.Close;
        end;
     end;
end;

procedure TFrmOutrasSaidas.FormShow(Sender: TObject);
begin
  inherited;
  panel3.Enabled   := false;
  panel4.Enabled   := false;
  if tag = 0 then
     begin
        bGrava     := true;
        bGravaItem := true;
        if not DM.Acesso('M013','I') then
           begin
             Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
             Botoes('C');
           end
        else
           begin
             Botoes('N');
             panel3.Enabled      := true;
             Edtdata.Text        := datetostr(date);
             iLocalEstoque       := 0;
             Edtdata.SetFocus;
           end;
     end
  else
     if tag = 1 then
        Botoes('G');
end;

procedure TFrmOutrasSaidas.BtnGravaClick(Sender: TObject);
var bTributado : boolean;
    cEstoque : currency;
begin
  inherited;
  if trim(EdtCodPro.Text) = '' then
     begin
        EdtCodPro.SetFocus;
        exit;
     end;

  if trim(EdtCodGRP.Text) = '' then
     begin
        EdtCodGRP.SetFocus;
        AlertaCad('Grupo de ICMS Inválido');
        exit;
     end;

  if trim(EdtCST.Text) = '' then
     begin
        EdtCST.SetFocus;
        AlertaCad('CST Inválido');
        exit;
     end;

  if strtocurr(edtquant.Text) = 0 then
     begin
        AlertaCad('Digite a quantidade');
//        edtquant.SetFocus;
        exit;
     end;

  if strtocurr(EdtValorUnit.Text) = 0 then
     begin
        AlertaCad('Digite o valor');
//        EdtValorUnit.SetFocus;
        exit;
     end;

  if (iCFOPTrib = 0) or (iCFOPSub = 0) then
     begin
        AlertaCad('CFOP Inválido, verifique o cadastro do tipo de Outras Saídas');
        exit;
     end;

  if iLocalEstoque = 0 then
     iLocalEstoque:= BuscaLocalEstoque;

  { Verifica esta ou vai ficar negativo }
  if not bEstoqueNegativo then
     begin
        cEstoque:= dm.BuscaEstoqueProduto(strtoint(EdtCodPro.Text), iEmp);

        if cEstoque - StrToCurr(EdtQuant.Text) < 0 then
           begin
              AlertaCad('Produto com estoque negativo');
//              EdtQuant.SetFocus;
              exit;
              abort;
           end;
     end;

  { verifica o grupo de icms do produto }
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  try
    try
      with dm.QConsulta do
         begin
            close;
            sql.Clear;
            sql.Text:= 'SELECT G.TIPO_GRP ' +
                       'FROM PRODUTO P ' +
                       'INNER JOIN GRUPO_ICMS G ' +
                       'ON (P.ICMS_CF_EST = G.COD_GRP) ' +
                       'WHERE P.COD_PRO = :CODPRO';
            Parambyname('codpro').AsInteger:= strtoint(EdtCodPro.Text);
            open;
            if trim(fieldbyname('tipo_grp').AsString) = 'ST' then
               bTributado:= false
            else
               bTributado:= true;
         end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      AlertaCad('erro ao buscar o grupo de icms do produto');
    end;
  finally
    dm.QConsulta.Close;
  end;

  if IBTROS.Active then
     IBTROS.Commit;
  IBTROS.StartTransaction;
  try
    try
      with IBSQLOS do
         begin
            close;
            sql.Clear;
            if bGravaItem = true then
               sql.Add('INSERT INTO ITENS_OUTRAS_SAIDAS (COD_OUTRA, ORDEM, COD_PRO, VALOR_ITEM, ' +
                       'QUANT_ITEM, COD_EMP, VALOR_CUSTO, CFOP, CANCELADO, COD_GRP, CST, ALIQ_ICMS, ' +
                       'REDUCAO_ICMS, IPI, CODIGO_LOCAL_ESTOQUE) ' +
                       'VALUES(:CODOUTRA, :ORDEM, :CODPRO, :VALORITEM, :QUANTITEM, :CODEMP, 0, :CFOP, 0, ' +
                       ':CODGRP, :CST, :ICMS, :REDICMS, :IPI, :LOCAL)');

            parambyname('codoutra').AsInteger   := strtoint(EdtCodigo.Text);
            parambyname('codpro').AsInteger     := strtoint(EdtCodPro.Text);
            Parambyname('valoritem').AsCurrency := strtocurr(EdtValorUnit.Text);
            parambyname('quantitem').AsCurrency := strtocurr(EdtQuant.Text);
            Parambyname('codemp').AsInteger     := iEmp;
            Parambyname('ordem').AsInteger      := ordem;
            if bTributado then
               parambyname('cfop').AsInteger    := iCFOPTrib
            else
               parambyname('cfop').AsInteger    := iCFOPSub;
            Parambyname('codgrp').AsInteger     := strtoint(EdtCodGRP.Text);
            Parambyname('cst').AsString         := trim(EdtCST.Text);
            Parambyname('icms').AsCurrency      := strtocurr(EdtAliqICMS.Text);
            Parambyname('redicms').AsCurrency   := strtocurr(EdtBCR.Text);
            Parambyname('ipi').AsCurrency       := strtocurr(EdtAliqIPI.Text);
            Parambyname('local').AsInteger      := iLocalEstoque;
            ExecOrOpen;
         end;
      IBTROS.Commit;
    except
      IBTROS.Rollback;
      AlertaCad('Erro ao Gravar o Item');
    end;
  finally
    bGravaItem:= true;
    IBSQLOS.Close;
    LimpaItens;
    BuscaItens;
    edtcodpro.SetFocus;
  end;
end;

procedure TFrmOutrasSaidas.BtnExcluiClick(Sender: TObject);
var iAuxOrdem : integer;
begin
  inherited;
  if Application.MessageBox('Confirma a Exclusão do Item?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
     begin
        iAuxOrdem:= QBuscaItensORDEM.AsInteger;
        if IBTROS.Active then
           IBTROS.Commit;
        QBuscaItens.Close;
        IBTROS.StartTransaction;
        try
          try
            with IBSQLOS do
               begin
                  close;
                  sql.Clear;
                  sql.Add('DELETE FROM ITENS_OUTRAS_SAIDAS ' +
                          'WHERE COD_OUTRA = :CODOUTRA AND ORDEM = :ORDEM');
                  Parambyname('codoutra').AsInteger := strtoint(EdtCodigo.text);
                  Parambyname('ordem').AsInteger    := iAuxOrdem;
                  ExecOrOpen;
               end;
            IBTROS.Commit;
          except
            IBTROS.Rollback;
            AlertaCad('Erro ao Excluir o Item');
          end;
        finally
          IBSQLOS.Close;
          LimpaItens;
          BuscaItens;
        end;
     end;
end;

procedure TFrmOutrasSaidas.EdtQuantExit(Sender: TObject);
begin
  inherited;
  if strtocurr(edtquant.Text) = 0 then
     begin
        edtquant.SetFocus;
        exit;
     end;
end;

procedure TFrmOutrasSaidas.EdtValorUnitExit(Sender: TObject);
begin
  inherited;
  if EdtValorUnit.Text = '0' then
     begin
        edtvalorunit.SetFocus;
        exit;
     end;
  EdtTotalProd.Text:= floattostr(strtofloat(EdtValorUnit.Text) * strtofloat(EdtQuant.Text));
end;

procedure TFrmOutrasSaidas.BtnAddTipoClick(Sender: TObject);
begin
  inherited;
  BuscaFormulario( TFrmCadTipoES, True );
end;

procedure TFrmOutrasSaidas.BtnConsTipoClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsTipoES, FrmConsTipoES);
  FrmConsTipoES.tag:= 2;
  FrmConsTipoES.showmodal;
end;

procedure TFrmOutrasSaidas.EdtCodTipoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = vk_f3 then
     BtnConsTipo.Click
  else
     if key = vk_f2 then
        BtnAddTipo.Click;
end;

procedure TFrmOutrasSaidas.EdtCodTipoExit(Sender: TObject);
begin
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  try
    try
      with dm.Consulta do
         begin
            close;
            sql.Clear;
            sql.Add('SELECT NOME_ES ' +
                    'FROM TIPO_ES ' +
                    'WHERE COD_ES = ' + EdtCodTipo.text + ' AND TIPO_ES = ' + #39 + 'S' + #39);
            ExecOrOpen;
            if recordcount > 0 then
               EdtNomeTipo.Text:= fieldbyname('nome_es').Value
            else
               begin
                  AlertaCad('Tipo de Outras Saídas não Cadastrado');
                  EdtNomeTipo.Clear;
//                  EdtCodTipo.SetFocus;
               end;
         end;
      dm.IBTransaction.Commit;
    except
      AlertaCad('Erro ao Buscar o Tipo de Outras Saídas');
      EdtNomeTipo.Clear;
//      EdtCodTipo.SetFocus;
    end;
  finally
      DM.Consulta.Close;
  end;
end;

procedure TFrmOutrasSaidas.BtnConsultarClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsOutrasSaidas, FrmConsOutrasSaidas);
  FrmConsOutrasSaidas.tag:= 0;
  FrmConsOutrasSaidas.showmodal;
end;

procedure TFrmOutrasSaidas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if IBTROS.Active then
     IBTROS.Commit;

  QBuscaItens.Close;

  Action:= caFree;
end;

procedure TFrmOutrasSaidas.EdtCodcliEnter(Sender: TObject);
begin
  inherited;
  EdtCodcli.SelectAll;
end;

procedure TFrmOutrasSaidas.EdtCodTipoEnter(Sender: TObject);
begin
  inherited;
  EdtCodTipo.SelectAll;
end;

procedure TFrmOutrasSaidas.EdtCodcliKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9', #13, #8]) then
     key:= #0;
end;

function TFrmOutrasSaidas.Ordem : integer;
begin
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QOrdem do
      begin
         close;
         Parambyname('codigo').AsInteger:= strtoint(EdtCodigo.Text);
         Open;
         result:= QOrdemORDEM.AsInteger + 1;
      end;
   dm.IBTransaction.Commit;
   QOrdem.Close;
end;

procedure TFrmOutrasSaidas.BtnFinalizaClick(Sender: TObject);
begin
  inherited;
  ToolBar1.SetFocus;

  {VERIFICA SE TEM ITENS}
  if QBuscaItens.RecordCount = 0 then
     begin
        AlertaCad('Nenhum Item Lançado');
        exit;
     end;

  {VERIFICA SE TOTAL > 0}
  if StrToCurr(EdtTotal.Text) < 0 then
     begin
        AlertaCad('Não pode finalizar uma venda com valor negativo');
        exit;
     end;

  { grava o total da saida }
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QConsulta do
     begin
        close;
        sql.Clear;
        sql.Text:= 'UPDATE OUTRAS_SAIDAS ' +
                   'SET TOTAL_OUTRA = :TOTAL ' +
                   'WHERE COD_OUTRA = :CODOUTRA';
        parambyname('codoutra').AsInteger:= strtoint(edtcodigo.Text);
        parambyname('total').AsCurrency  := strtocurr(EdtTotal.Text);
        ExecOrOpen;
     end;
  dm.IBTransaction.Commit;
  dm.QConsulta.Close;

  bSaidaAberta:= false;
  Application.CreateForm(TFrmDadosNotaFiscal, FrmDadosNotaFiscal);
  FrmDadosNotaFiscal.EdtDataEmissao.Text:= EdtData.Text;
  FrmDadosNotaFiscal.Tag:= 1;
  FrmDadosNotaFiscal.showmodal;
end;

procedure TFrmOutrasSaidas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if bSaidaAberta then
     begin
        AlertaCad('Outras Saídas Aberta');
        CanClose:= false;
     end;
end;

procedure TFrmOutrasSaidas.FormCreate(Sender: TObject);
begin
  inherited;

  if trim(dm.RetornaStringTabela('saidas_estoque_negativo', 'parametros', 'cod_emp', iEmp)) = 'S' then
     bEstoqueNegativo:= true
  else
     bEstoqueNegativo:= false;
end;

procedure TFrmOutrasSaidas.BtnAddGRPClick(Sender: TObject);
begin
  inherited;
  BuscaFormulario( TFrmCadGICMS, True );
end;

procedure TFrmOutrasSaidas.BtnConsGRPClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsGRP, FrmConsGRP);
  FrmConsGRP.Tag:= 19;
  FrmConsGRP.ShowModal;
end;

procedure TFrmOutrasSaidas.EdtCodGRPEnter(Sender: TObject);
begin
  inherited;
  EdtCodGRP.SelectAll;
end;

procedure TFrmOutrasSaidas.EdtCodGRPExit(Sender: TObject);
begin
  inherited;
  if (ToolBar1.Focused) or (DBGrid1.Focused) then
     exit;

  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  try
    try
      with dm.Consulta do
         begin
            close;
            sql.Clear;
            sql.add('SELECT NOME_GRP, ALIQUOTA_GRP ' +
                    'FROM GRUPO_ICMS ' +
                    'WHERE COD_GRP = :CODGRP');
            Parambyname('codgrp').AsInteger:= strtoint(EdtCodGRP.text);
            ExecOrOpen;
            if fieldbyname('nome_grp').IsNull then
               begin
                  AlertaCad('Grupo de ICMS não Cadastrado');
                  EdtAliqICMS.Clear;
               end
            else
               begin
                  EdtNomeGRP.Text := fieldbyname('nome_grp').AsString;
                  EdtAliqICMS.Text:= fieldbyname('aliquota_grp').AsString;
               end;
         end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      AlertaCad('Erro ao buscar o grupo de icms');
      EdtNomeGRP.Clear;
      EdtAliqICMS.clear;
    end;
  finally
    dm.Consulta.Close;
  end;
end;

procedure TFrmOutrasSaidas.EdtCodGRPKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = vk_f3 then
     BtnConsGRP.Click
  else
     if key = vk_f2 then
        BtnAddGRP.Click;
end;

end.

