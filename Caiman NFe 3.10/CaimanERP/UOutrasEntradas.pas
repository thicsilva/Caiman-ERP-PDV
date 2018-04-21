unit UOutrasEntradas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, ImgList, ComCtrls, ToolWin, ExtCtrls, Grids, DBGrids, 
  StdCtrls, Buttons, Mask, DB, rxToolEdit, rxCurrEdit, UNovosComponentes, 
  UNovoFormulario, cxGraphics, cxControls, cxLookAndFeels, 
  cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, dxSkinMetropolisDark, 
  dxSkinOffice2013White, dxSkinsdxStatusBarPainter, acAlphaImageList, 
  dxStatusBar, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, 
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, 
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmOutrasEntradas = class(TFrmCadastroNovo)
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label21: TLabel;
    BtnConsFor: TsSpeedButton;
    BtnAddFor: TsSpeedButton;
    Label22: TLabel;
    Label3: TLabel;
    BtnConsTipo: TsSpeedButton;
    BtnAddTipo: TsSpeedButton;
    EdtCodigo: UNovosComponentes.TEdit;
    EdtCodFor: UNovosComponentes.TEdit;
    EdtNomeFor: TEdit;
    EdtData: TMaskEdit;
    EdtCodTipo: UNovosComponentes.TEdit;
    EdtNomeTipo: TEdit;
    Panel4: TPanel;
    Label17: TLabel;
    BtnConsPro: TsSpeedButton;
    BtnAddPro: TsSpeedButton;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label24: TLabel;
    Label30: TLabel;
    EdtCodPro: UNovosComponentes.TEdit;
    EdtNomePro: TEdit;
    EdtQuant: TCurrencyEdit;
    EdtValorUnit: TCurrencyEdit;
    EdtTotalProd: TCurrencyEdit;
    BtnGrava: TBitBtn;
    BtnExclui: TBitBtn;
    DBGrid1: TDBGrid;
    IBTROE: TFDTransaction;
    QBuscaItens: TFDQuery;
    DSQBuscaItens: TDataSource;
    IBSQLOE: TFDQuery;
    EdtTotal: TCurrencyEdit;
    GroupBox1: TGroupBox;
    ToolButton1: TToolButton;
    BtnFinaliza: TToolButton;
    QOrdem: TFDQuery;
    QOrdemORDEM: TIntegerField;
    Label46: TLabel;
    EdtCodGRP: UNovosComponentes.TEdit;
    BtnConsGRP: TsSpeedButton;
    BtnAddGRP: TsSpeedButton;
    EdtNomeGRP: TEdit;
    Label47: TLabel;
    Label26: TLabel;
    EdtCST: TEdit;
    EdtAliqICMS: TCurrencyEdit;
    Label27: TLabel;
    Label63: TLabel;
    EdtBCR: TCurrencyEdit;
    Label41: TLabel;
    EdtAliqIPI: TCurrencyEdit;
    QBuscaItensCOD_OUTRA: TIntegerField;
    QBuscaItensCOD_PRO: TIntegerField;
    QBuscaItensCOD_EMP: TIntegerField;
    QBuscaItensQUANT_ITEM: TBCDField;
    QBuscaItensCFOP: TIntegerField;
    QBuscaItensORDEM: TIntegerField;
    QBuscaItensCANCELADO: TIntegerField;
    QBuscaItensVALOR_ITEM: TBCDField;
    QBuscaItensCODIGO_LOCAL_ESTOQUE: TIntegerField;
    QBuscaItensCOD_GRP: TIntegerField;
    QBuscaItensCST: TStringField;
    QBuscaItensALIQ_ICMS: TBCDField;
    QBuscaItensREDUCAO_ICMS: TBCDField;
    QBuscaItensIPI: TBCDField;
    QBuscaItensNOME_PRO: TStringField;
    QBuscaItensDESCRICAO: TStringField;
    QBuscaItensCALC_TOTAL: TCurrencyField;
    procedure BuscaItens;
    procedure LimpaItens;
    procedure Botoes(acao : string);
    procedure BtnConsForClick(Sender: TObject);
    procedure BtnAddForClick(Sender: TObject);
    procedure EdtDataExit(Sender: TObject);
    procedure EdtCodForKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodForExit(Sender: TObject);
    procedure QBuscaItensCalcFields(DataSet: TDataSet);
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnConsultarClick(Sender: TObject);
    procedure EdtCodForKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodForEnter(Sender: TObject);
    procedure EdtCodTipoEnter(Sender: TObject);
    function  PrecoVenda : boolean;
    procedure BuscaCFOP;
    procedure BtnFinalizaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    function  Ordem : integer;
    function  BuscaLocalEstoque : integer;
    procedure EdtCodGRPEnter(Sender: TObject);
    procedure EdtCodGRPExit(Sender: TObject);
    procedure EdtCodGRPKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsGRPClick(Sender: TObject);
    procedure BtnAddGRPClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmOutrasEntradas: TFrmOutrasEntradas;
  bPrecoVenda  : boolean;

implementation
uses
  Udm, Ubibli1, UConsFor, UCadFor, UConsProd, UCadProduto, UCadTipoES, 
  UConsTipoES, UConsOutrasEntradas, UDadosNotaFiscal, UConsGRP, UCadGICMS, 
  UNovoPrincipal;
var  bGrava          : boolean;
     bEntradaAberta  : boolean;
     iCFOPTrib       : integer;
     iCFOPSub        : integer;
     iLocalEstoque   : integer;
     iGrpIcmsEsp     : integer;

{$R *.dfm}

procedure TFrmOutrasEntradas.Botoes(acao : string);
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
                Limpaedit(FrmOutrasEntradas);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin
         if not (acao = 'G') then
            Limpaedit(FrmOutrasEntradas);
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

function TFrmOutrasEntradas.BuscaLocalEstoque : integer;
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

function TFrmOutrasEntradas.Ordem : integer;
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

function TFrmOutrasEntradas.PrecoVenda : boolean;
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

procedure TFrmOutrasEntradas.BuscaCFOP;
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

procedure TFrmOutrasEntradas.LimpaItens;
begin
   edtcodpro.Clear;
   edtnomepro.Clear;
   edtquant.Text:= '1';
   EdtValorUnit.Clear;
   EdtTotalProd.Clear;
   EdtCodGRP.clear;
   EdtNomeGRP.clear;
   EdtCST.clear;
   EdtAliqICMS.Clear;
   EdtBCR.Clear;
   EdtAliqIPI.Clear;
end;

procedure TFrmOutrasEntradas.BuscaItens;
var cTotal: currency;
begin
   cTotal:= 0;
   if IBTROE.Active then
      IBTROE.Commit;
   IBTROE.StartTransaction;
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

procedure TFrmOutrasEntradas.BtnConsForClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsFor, FrmConsFor);
  FrmConsFor.tag:= 13;
  FrmConsFor.showmodal;
end;

procedure TFrmOutrasEntradas.BtnAddForClick(Sender: TObject);
begin
  inherited;
  BuscaFormulario( TFrmCadFor, True );
end;

procedure TFrmOutrasEntradas.EdtDataExit(Sender: TObject);
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

procedure TFrmOutrasEntradas.EdtCodForKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = vk_f3 then
     BtnConsFor.Click
  else
     if key = vk_f2 then
        BtnAddFor.Click;
end;

procedure TFrmOutrasEntradas.EdtCodForExit(Sender: TObject);
var sEstFor     : string;
    sUFEmpresa  : string;
begin
  inherited;
  EdtNomeFor.Text:= consulta('fornecedor', EdtCodFor, 'cod_for', 'razao_for', dm.IBTransaction, dm.qConsulta);
  if EdtNomeFor.Text = '' then
     begin
        AlertaCad('Fornecedor não Cadastrado');
//        EdtCodFor.SetFocus;
     end
  else
     begin
        sUFEmpresa  := dm.RetornaStringTabela('est_emp', 'empresa', 'cod_emp', iEmp);
        sEstFor     := dm.RetornaStringTabela('est_for', 'fornecedor', 'cod_for', strtoint(EdtCodFor.text));
        if trim(sUFEmpresa) = trim(sEstFor) then
           bNoEstado:= true
        else
           bNoEstado:= false;
     end;
end;

procedure TFrmOutrasEntradas.QBuscaItensCalcFields(DataSet: TDataSet);
begin
  inherited;
  QBuscaItensCALC_TOTAL.AsCurrency:= QBuscaItensVALOR_ITEM.AsCurrency * QBuscaItensQUANT_ITEM.AsCurrency;
end;

procedure TFrmOutrasEntradas.BtnConsProClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsProd, FrmConsProd);
  FrmConsProd.tag:= 10;
  FrmConsProd.showmodal;
end;

procedure TFrmOutrasEntradas.BtnAddProClick(Sender: TObject);
begin
  inherited;
  BuscaFormulario( TFrmCadProduto, True );

end;

procedure TFrmOutrasEntradas.EdtCodProEnter(Sender: TObject);
begin
  inherited;
  edtcodpro.SelectAll;
end;

procedure TFrmOutrasEntradas.EdtCodProExit(Sender: TObject);
begin
  inherited;
  if (DBGrid1.Focused) or (ToolBar1.focused) then
      exit;

  if trim(EdtCodPro.Text) = '' then
     begin
        EdtCodPro.SetFocus;
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
                  AlertaCad('Produto não Cadastrado');
                  edtnomepro.Clear;
//                  edtcodpro.SetFocus;
               end;
         end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      AlertaCad('Erro ao Buscar o Produto');
      edtnomepro.Clear;
//      edtcodpro.SetFocus;
    end;
  finally
    dm.Consulta.Close;
  end;
end;

procedure TFrmOutrasEntradas.EdtCodProKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = vk_f3 then
     BtnConsPro.Click
  else
     if key = vk_f2 then
        BtnAddPro.Click;
end;

procedure TFrmOutrasEntradas.BtnGravarClick(Sender: TObject);
begin
  inherited;
  if (bGrava) and (not DM.Acesso('M014','I')) then
     begin
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;

  if EdtCodFor.Text = '' then
     begin
        AlertaCad('Digite o Código do Fornecedor');
//        EdtCodFor.SetFocus;
        exit;
     end;

  if iLocalEstoque = 0 then
     iLocalEstoque:= BuscaLocalEstoque;

  if IBTROE.Active then
     IBTROE.Commit;
  IBTROE.StartTransaction;
  try
    try
      with IBSQLOE do
         begin
            close;
            sql.Clear;
            if bGrava then
               begin
                  sql.Add('INSERT INTO OUTRAS_ENTRADAS (COD_OUTRA, DATA_OUTRA, COD_ES, COD_FOR, COD_EMP, CANCELADA) ' +
                          'VALUES(:CODOUTRA, :DATAOUTRA, :CODES, :CODFOR, :CODEMP, 0)');
                  EdtCodigo.Text:= inttostr(prxcod('outras_entradas', 'cod_outra', dm.IBTransaction, dm.ibsqlcod));
                  Parambyname('codemp').AsInteger:= iEmp;
               end
            else
               sql.Add('UPDATE OUTRAS_ENTRADAS SET DATA_OUTRA = :DATAOUTRA, COD_ES = :CODES, COD_FOR = :CODFOR ' +
                       'WHERE COD_OUTRA = :CODOUTRA');
            Parambyname('codoutra').AsInteger      := StrToInt(EdtCodigo.Text);
            Parambyname('dataoutra').AsDate        := strtodate(EdtData.Text);
            Parambyname('codes').AsInteger         := strtoint(EdtCodTipo.Text);
            Parambyname('codfor').AsInteger        := strtoint(EdtCodFor.Text);
            ExecOrOpen;
         end;
      IBTROE.Commit;
      bEntradaAberta:= true;
      Botoes('G');
      panel3.Enabled:= false;
      panel4.Enabled:= true;
      EdtCodPro.SetFocus;
    except
      IBTROE.Rollback;
      bEntradaAberta:= false;
      AlertaCad('Erro ao Gravar o Lançamento');
      panel3.Enabled:= true;
      panel4.Enabled:= false;
    end;
  finally
     IBSQLOE.Close;
     BuscaCFOP;
     iLocalEstoque:= BuscaLocalEstoque;
     bPrecoVenda  := PrecoVenda;
     BuscaItens;
  end;
end;

procedure TFrmOutrasEntradas.BtnNovoClick(Sender: TObject);
begin
  inherited;
  ToolBar1.SetFocus;
  if IBTROE.Active then
     IBTROE.Commit;
  QBuscaItens.Close;
  bGrava     := true;

  if not DM.Acesso('M014','I') then
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

procedure TFrmOutrasEntradas.BtnCancelarClick(Sender: TObject);
begin
  inherited;
  ToolBar1.SetFocus;

  if bEntradaAberta then
     begin
        AlertaCad('Outras Entradas Aberta');
        exit;
     end;

  if not panel3.Enabled then
     AlertaCad('Lançamento gravado')
  else
     begin
        bEntradaAberta:= false;
        Botoes('C');
        panel3.Enabled:= false;
        panel4.Enabled:= false;
     end;
end;

procedure TFrmOutrasEntradas.BtnAlterarClick(Sender: TObject);
begin
  inherited;
  if not DM.Acesso('M014','A') then
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

procedure TFrmOutrasEntradas.BtnExcluirClick(Sender: TObject);
begin
  inherited;
  ToolBar1.SetFocus;
  if not DM.Acesso('M014','E') then
     begin
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  if Application.MessageBox('Confirma a Exclusão do Acerto?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
     begin
        if IBTROE.Active then
           IBTROE.Commit;
        QBuscaItens.Close;
        IBTROE.StartTransaction;
        try
          try
            with IBSQLOE do
               begin
                  close;
                  sql.Clear;
                  sql.Add('DELETE FROM OUTRAS_ENTRADAS WHERE COD_OUTRA = :CODOUTRA');
                  Parambyname('codoutra').AsInteger:= strtoint(EdtCodigo.Text);
                  ExecOrOpen;
               end;
            IBTROE.Commit;
            panel3.Enabled:= false;
            panel4.Enabled:= false;
            bEntradaAberta:= false;
            Botoes('E');
          except
            IBTROE.Rollback;
            bEntradaAberta:= true;
            AlertaCad('Erro ao Excluir o Lançamento');
          end;
        finally
          IBSQLOE.Close;
        end;
     end;
end;

procedure TFrmOutrasEntradas.FormShow(Sender: TObject);
begin
  inherited;
  panel3.Enabled:= false;
  panel4.Enabled:= false;
  if tag = 0 then
     begin
        bGrava:= true;
        if not DM.Acesso('M014','I') then
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

procedure TFrmOutrasEntradas.BtnGravaClick(Sender: TObject);
var bTributado : boolean;
begin
  inherited;
  if trim(EdtCodPro.Text) = '' then
     begin
        EdtCodPro.SetFocus;
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

  if (iCFOPTrib = 0) or (iCFOPSub = 0) then
     begin
        AlertaCad('Verifique o CFOP no cadastro de Tipo de Outras Entradas');
        exit;
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

  if IBTROE.Active then
     IBTROE.Commit;
  IBTROE.StartTransaction;
  try
    try
      with IBSQLOE do
         begin
            close;
            sql.Clear;
            sql.Text:= 'INSERT INTO ITENS_OUTRAS_ENTRADAS (COD_OUTRA, ORDEM, COD_PRO, VALOR_ITEM, ' +
                       'QUANT_ITEM, COD_EMP, CFOP, CANCELADO, CODIGO_LOCAL_ESTOQUE, COD_GRP, CST, ALIQ_ICMS, ' +
                       'REDUCAO_ICMS, IPI) ' +
                       'VALUES(:CODOUTRA, :ORDEM, :CODPRO, :VALORITEM, :QUANTITEM, :CODEMP, :CFOP, 0, :LOCAL, ' +
                       ':CODGRP, :CST, :ALIQ, :RED, :IPI)';

            parambyname('codoutra').AsInteger     := strtoint(EdtCodigo.Text);
            Parambyname('ordem').AsInteger        := ordem;
            parambyname('codpro').AsInteger       := strtoint(EdtCodPro.Text);
            Parambyname('valoritem').AsCurrency   := StrToCurr(EdtValorUnit.Text);
            parambyname('quantitem').AsCurrency   := StrToCurr(EdtQuant.Text);
            Parambyname('codemp').AsInteger       := iEmp;
            if bTributado then
               parambyname('cfop').AsInteger      := iCFOPTrib
            else
               parambyname('cfop').AsInteger      := iCFOPSub;

            Parambyname('local').AsInteger        := iLocalEstoque;
            Parambyname('codgrp').AsInteger      := strtoint(EdtCodGRP.Text);
            Parambyname('cst').AsString          := trim(EdtCST.Text);
            Parambyname('aliq').AsCurrency       := strtocurr(EdtAliqICMS.Text);
            Parambyname('red').AsCurrency        := strtocurr(EdtBCR.Text);
            Parambyname('ipi').AsCurrency        := strtocurr(EdtAliqIPI.Text);
            ExecOrOpen;
         end;
      IBTROE.Commit;
    except
      IBTROE.Rollback;
      AlertaCad('Erro ao Gravar o Item');
    end;
  finally
    IBSQLOE.Close;
    LimpaItens;
    BuscaItens;
    edtcodpro.SetFocus;
  end;
end;

procedure TFrmOutrasEntradas.BtnExcluiClick(Sender: TObject);
var iAuxOrdem : integer;
begin
  inherited;
  if Application.MessageBox('Confirma a Exclusão do Item?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
     begin
        iAuxOrdem:= QBuscaItensORDEM.AsInteger;
        if IBTROE.Active then
           IBTROE.Commit;
        QBuscaItens.Close;
        IBTROE.StartTransaction;
        try
          try
            with IBSQLOE do
               begin
                  close;
                  sql.Clear;
                  sql.Add('DELETE FROM ITENS_OUTRAS_ENTRADAS ' +
                          'WHERE COD_OUTRA = :CODOUTRA AND ORDEM = :ORDEM');
                  Parambyname('codoutra').AsInteger := strtoint(EdtCodigo.text);
                  Parambyname('ordem').AsInteger    := iAuxOrdem;
                  ExecOrOpen;
               end;
            IBTROE.Commit;
          except
            IBTROE.Rollback;
            AlertaCad('Erro ao Excluir o Item');
          end;
        finally
          IBSQLOE.Close;
          LimpaItens;
          BuscaItens;
        end;
     end;
end;

procedure TFrmOutrasEntradas.EdtQuantExit(Sender: TObject);
begin
  inherited;
  if edtquant.Text = '0' then
     edtquant.SetFocus;
end;

procedure TFrmOutrasEntradas.EdtValorUnitExit(Sender: TObject);
begin
  inherited;
  if EdtValorUnit.Text = '0' then
     begin
        edtvalorunit.SetFocus;
        exit;
     end;
  EdtTotalProd.Text:= floattostr(strtofloat(EdtValorUnit.Text) * strtofloat(EdtQuant.Text));
end;

procedure TFrmOutrasEntradas.BtnAddTipoClick(Sender: TObject);
begin
  inherited;
  BuscaFormulario( TFrmCadTipoES, True );
end;

procedure TFrmOutrasEntradas.BtnConsTipoClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsTipoES, FrmConsTipoES);
  FrmConsTipoES.tag:= 3;
  FrmConsTipoES.showmodal;
end;

procedure TFrmOutrasEntradas.EdtCodTipoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = vk_f3 then
     BtnConsTipo.Click
  else
     if key = vk_f2 then
        BtnAddTipo.Click;
end;

procedure TFrmOutrasEntradas.EdtCodTipoExit(Sender: TObject);
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
                    'WHERE COD_ES = ' + EdtCodTipo.text + ' AND TIPO_ES = ' + #39 + 'E' + #39);
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

procedure TFrmOutrasEntradas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if IBTROE.Active then
     IBTROE.Commit;
  QBuscaItens.Close;

  Action:= caFree;
end;

procedure TFrmOutrasEntradas.BtnConsultarClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsOutrasEntradas, FrmConsOutrasEntradas);
  FrmConsOutrasEntradas.TAG:= 0;
  FrmConsOutrasEntradas.SHOWMODAL;
end;

procedure TFrmOutrasEntradas.EdtCodForKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9', #13, #8]) then
     key:= #0;
end;

procedure TFrmOutrasEntradas.EdtCodForEnter(Sender: TObject);
begin
  inherited;
  EdtCodFor.SelectAll;
end;

procedure TFrmOutrasEntradas.EdtCodTipoEnter(Sender: TObject);
begin
  inherited;
  EdtCodTipo.SelectAll;
end;

procedure TFrmOutrasEntradas.BtnFinalizaClick(Sender: TObject);
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

  { grava o total da entrada }
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QConsulta do
     begin
        close;
        sql.Clear;
        sql.Text:= 'UPDATE OUTRAS_ENTRADAS ' +
                   'SET TOTAL_OUTRA = :TOTAL ' +
                   'WHERE COD_OUTRA = :CODOUTRA';
        parambyname('codoutra').AsInteger := strtoint(edtcodigo.Text);
        parambyname('total').AsCurrency   := strtocurr(EdtTotal.Text);
        ExecOrOpen;
     end;
  dm.IBTransaction.Commit;
  dm.QConsulta.Close;

  bEntradaAberta:= false;
  Application.CreateForm(TFrmDadosNotaFiscal, FrmDadosNotaFiscal);
  FrmDadosNotaFiscal.Tag:= 2;
  FrmDadosNotaFiscal.EdtDataEmissao.Text:= EdtData.Text;
  FrmDadosNotaFiscal.showmodal;
end;

procedure TFrmOutrasEntradas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if bEntradaAberta then
     begin
        AlertaCad('Outras Entradas Aberta');
        CanClose:= false;
     end;
end;

procedure TFrmOutrasEntradas.EdtCodGRPEnter(Sender: TObject);
begin
  inherited;
  EdtCodGRP.SelectAll;
end;

procedure TFrmOutrasEntradas.EdtCodGRPExit(Sender: TObject);
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

procedure TFrmOutrasEntradas.EdtCodGRPKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = vk_f3 then
     BtnConsGRP.Click
  else
     if key = vk_f2 then
        BtnAddGRP.Click;
end;

procedure TFrmOutrasEntradas.BtnConsGRPClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsGRP, FrmConsGRP);
  FrmConsGRP.Tag:= 20;
  FrmConsGRP.ShowModal;
end;

procedure TFrmOutrasEntradas.BtnAddGRPClick(Sender: TObject);
begin
  inherited;
  BuscaFormulario( TFrmCadGICMS, True );
end;

end.

