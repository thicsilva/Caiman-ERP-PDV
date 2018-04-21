unit UTransfLocaisEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, ImgList, ComCtrls, ToolWin, ExtCtrls, StdCtrls, Buttons, 
  Grids, DBGrids, Mask, DB, rxToolEdit, rxCurrEdit, UNovosComponentes, 
  UNovoFormulario, cxGraphics, cxControls, cxLookAndFeels, 
  cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, dxSkinMetropolisDark, 
  dxSkinOffice2013White, dxSkinsdxStatusBarPainter, acAlphaImageList, 
  dxStatusBar, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmTransfLocaisEstoque = class(TFrmCadastroNovo)
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label21: TLabel;
    BtnConsOrigem: TsSpeedButton;
    Label22: TLabel;
    Label5: TLabel;
    BtnConsDestino: TsSpeedButton;
    Label6: TLabel;
    LConv: TLabel;
    EdtCodigo: UNovosComponentes.TEdit;
    EdtCodOrigem: UNovosComponentes.TEdit;
    EdtNomeOrigem: TEdit;
    EdtCodDestino: UNovosComponentes.TEdit;
    EdtNomeDestino: TEdit;
    EdtData: TMaskEdit;
    Panel5: TPanel;
    Panel4: TPanel;
    Label19: TLabel;
    BtnConsPro: TsSpeedButton;
    BtnAddPro: TsSpeedButton;
    Label18: TLabel;
    Label3: TLabel;
    Label16: TLabel;
    EdtQuant: TCurrencyEdit;
    EdtNomePro: TEdit;
    DBGrid1: TDBGrid;
    EdtCodPro: UNovosComponentes.TEdit;
    BtnGrava: TBitBtn;
    BtnExclui: TBitBtn;
    QOrdem: TFDQuery;
    QOrdemORDEM: TIntegerField;
    IBTRTransf: TFDTransaction;
    IBSQLTransf: TFDQuery;
    QBuscaItens: TFDQuery;
    DSQBuscaItens: TDataSource;
    QInsert: TFDQuery;
    QInsertCODIGO: TIntegerField;
    QBuscaItensCODIGO: TIntegerField;
    QBuscaItensORDEM: TIntegerField;
    QBuscaItensCOD_PRO: TIntegerField;
    QBuscaItensQUANT: TBCDField;
    QBuscaItensCOD_EMP: TIntegerField;
    QBuscaItensNOME_PRO: TStringField;
    QBuscaItensDESCRICAO: TStringField;
    Label4: TLabel;
    EdtEstoqueOrigem: TCurrencyEdit;
    Label7: TLabel;
    EdtEstoqueDestino: TCurrencyEdit;
    Panel6: TPanel;
    procedure EdtCodOrigemEnter(Sender: TObject);
    procedure EdtCodOrigemKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodDestinoEnter(Sender: TObject);
    procedure EdtCodOrigemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodDestinoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodOrigemExit(Sender: TObject);
    procedure EdtCodDestinoExit(Sender: TObject);
    procedure BtnConsOrigemClick(Sender: TObject);
    procedure BtnConsDestinoClick(Sender: TObject);
    procedure BtnAddProClick(Sender: TObject);
    procedure BtnConsProClick(Sender: TObject);
    procedure EdtCodProEnter(Sender: TObject);
    procedure EdtCodProExit(Sender: TObject);
    procedure EdtCodProKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Botoes(acao : string);
    function  Ordem : integer;
    procedure LimpaItens;
    procedure BuscaItens;
    procedure BtnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
    procedure BtnExcluiClick(Sender: TObject);
    procedure BuscaLocaisDefault;
    function  BuscaEstoqueLocal(const iCodPro, iEmpresa, iLocal : integer) : currency;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function FrmTransfLocaisEstoque: TFrmTransfLocaisEstoque;

implementation

uses
  UDM, Ubibli1, UConsLocaisEstoque, UCadProduto, UConsProd, UNovoPrincipal;
var  iOrdem : integer;

{$R *.dfm}

function FrmTransfLocaisEstoque: TFrmTransfLocaisEstoque;
begin
   Result := TFrmTransfLocaisEstoque( BuscaFormulario( TFrmTransfLocaisEstoque, False ) );
end;

function TFrmTransfLocaisEstoque.BuscaEstoqueLocal(const iCodPro, iEmpresa, iLocal : integer) : currency;
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
             sql.add('SELECT SUM(ESTOQUE) ESTOQUE ' +
                     'FROM ESTOQUE   ' +
                     'WHERE COD_PRO = :CODPRO AND CODIGO_LOCAL_ESTOQUE = :LOCAL AND COD_EMP = :CODEMP');
             Parambyname('codpro').AsInteger := iCodPro;
             Parambyname('codemp').AsInteger := iEmpresa;
             Parambyname('local').AsInteger  := iLocal;
             open;
             result:= fieldbyname('estoque').AsCurrency;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar o estoque do produto');
     end;
   finally
     dm.QConsulta.Close;
   end;
end;

procedure TFrmTransfLocaisEstoque.BuscaLocaisDefault;
begin
   EdtCodOrigem.Text:= inttostr(dm.RetornaIntegerTabela('default_local_origem', 'parametros', 'cod_emp', iEmp));
   EdtCodOrigemExit(self);

   EdtCodDestino.Text:= inttostr(dm.RetornaIntegerTabela('default_local_destino', 'parametros', 'cod_emp', iEmp));
   EdtCodDestinoExit(self);
end;

procedure TFrmTransfLocaisEstoque.Botoes(acao : string);
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
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin
                Limpaedit(FrmTransfLocaisEstoque);
                btnExcluir.Enabled   := false;
                btnCancelar.Enabled  := true;
             end
          else
             begin
                btnExcluir.Enabled   := true;
                btnCancelar.Enabled  := false;
             end;
          BtnConsultar.Enabled := false;
      end
   else
      begin
         if not (acao = 'G') then
            Limpaedit(FrmTransfLocaisEstoque);
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

function TFrmTransfLocaisEstoque.Ordem : integer;
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

procedure TFrmTransfLocaisEstoque.BuscaItens;
begin
   if IBTRTransf.Active then
      IBTRTransf.Commit;
   IBTRTransf.StartTransaction;
   with QBuscaItens do
      begin
         close;
         Parambyname('codigo').AsInteger:= strtoint(EdtCodigo.Text);
         open;
         last;
      end;
end;

procedure TFrmTransfLocaisEstoque.LimpaItens;
begin
   EdtCodPro.Clear;
   EdtNomePro.Clear;
   EdtQuant.Text:= '1';
   EdtEstoqueOrigem.Clear;
   EdtEstoqueDestino.Clear;
end;

procedure TFrmTransfLocaisEstoque.EdtCodOrigemEnter(Sender: TObject);
begin
  inherited;
  EdtCodOrigem.SelectAll;
end;

procedure TFrmTransfLocaisEstoque.EdtCodOrigemKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9', #13, #8]) then
     key := #0;
end;

procedure TFrmTransfLocaisEstoque.EdtCodDestinoEnter(Sender: TObject);
begin
  inherited;
  EdtCodDestino.SelectAll;
end;

procedure TFrmTransfLocaisEstoque.EdtCodOrigemKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = vk_f3 then
     BtnConsOrigem.Click;
end;

procedure TFrmTransfLocaisEstoque.EdtCodDestinoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = vk_f3 then
     BtnConsDestino.Click;
end;

procedure TFrmTransfLocaisEstoque.EdtCodOrigemExit(Sender: TObject);
begin
  inherited;
  if ToolBar1.Focused then
     exit;

  EdtNomeOrigem.Text:= consulta('locais_estoque', EdtCodOrigem, 'codigo', 'descricao', dm.IBTransaction, dm.qConsulta);
  if trim(EdtNomeOrigem.Text) = '' then
     begin
        AlertaCad('Local de Estoque não Cadastrado');
//        EdtCodOrigem.SetFocus;
        exit;
     end;
end;

procedure TFrmTransfLocaisEstoque.EdtCodDestinoExit(Sender: TObject);
begin
  inherited;
  if ToolBar1.Focused then
     exit;

  EdtNomeDestino.Text:= consulta('locais_estoque', EdtCodDestino, 'codigo', 'descricao', dm.IBTransaction, dm.qConsulta);
  if trim(EdtNomeDestino.Text) = '' then
     begin
        AlertaCad('Local de Estoque não Cadastrado');
//        EdtCodDestino.SetFocus;
        exit;
     end;
end;

procedure TFrmTransfLocaisEstoque.BtnConsOrigemClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsLocaisEstoque, FrmConsLocaisEstoque);
  FrmConsLocaisEstoque.Tag:= 7;
  FrmConsLocaisEstoque.ShowModal;
end;

procedure TFrmTransfLocaisEstoque.BtnConsDestinoClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsLocaisEstoque, FrmConsLocaisEstoque);
  FrmConsLocaisEstoque.Tag:= 8;
  FrmConsLocaisEstoque.ShowModal;
end;

procedure TFrmTransfLocaisEstoque.BtnAddProClick(Sender: TObject);
begin
  inherited;
   BuscaFormulario( TFrmCadProduto, True  );
end;

procedure TFrmTransfLocaisEstoque.BtnConsProClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmConsProd, FrmConsProd);
  FrmConsProd.Tag := 32;
  FrmConsProd.showmodal;
end;

procedure TFrmTransfLocaisEstoque.EdtCodProEnter(Sender: TObject);
begin
  inherited;
  EdtCodPro.SelectAll;
end;

procedure TFrmTransfLocaisEstoque.EdtCodProExit(Sender: TObject);
var bAux : boolean;
begin
  inherited;
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
            if Length(Trim(EdtCodPro.text)) > 7 then
               begin
                  sql.Add('SELECT COD_PRO, NOME_PRO  ' +
                          'FROM PRODUTO WHERE CODIGO_BARRA_PRO = ' + #39 + trim(EdtCodPro.Text) + #39);
               end
            else
               begin
                  sql.Add('SELECT COD_PRO, NOME_PRO ' +
                          'FROM PRODUTO WHERE COD_PRO = :CODPRO');
                  Parambyname('codpro').AsInteger:= strtoint(EdtCodPro.text);
               end;
            Open;
            if not (fieldbyname('cod_pro').IsNull) then
               begin
                  bAux:= true;
                  EdtCodPro.Text  := fieldbyname('cod_pro').AsString;
                  EdtNomePro.Text := fieldbyname('nome_pro').AsString;
                  EdtQuant.SetFocus;
               end
            else
               begin
                  bAux:= false;
                  AlertaCad('Produto não Cadastrado');
                  edtnomepro.Clear;
//                  edtcodpro.SetFocus;
               end;
         end;
      dm.IBTransaction.Commit;
    except
      bAux:= false;
      dm.IBTransaction.Rollback;
      AlertaCad('Erro ao Buscar o Produto');
      edtnomepro.Clear;
//      edtcodpro.SetFocus;
    end;
  finally
      dm.Consulta.Close;
  end;

  if bAux then
     begin
        EdtEstoqueOrigem.Text  := currtostr(BuscaEstoqueLocal(strtoint(EdtCodPro.Text), iEmp, strtoint(EdtCodOrigem.Text)));
        EdtEstoqueDestino.Text := currtostr(BuscaEstoqueLocal(strtoint(EdtCodPro.Text), iEmp, strtoint(EdtCodDestino.Text)));
     end;
end;

procedure TFrmTransfLocaisEstoque.EdtCodProKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = vk_f3 then
     BtnConsPro.Click
  else
     if key = vk_f2 then
        BtnAddPro.Click;
end;

procedure TFrmTransfLocaisEstoque.BtnNovoClick(Sender: TObject);
begin
  inherited;
  ToolBar1.SetFocus;

  if IBTRTransf.Active then
     IBTRTransf.Commit;
  QBuscaItens.Close;
  LimpaItens;

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
  BuscaLocaisDefault;
  Edtdata.SetFocus;
end;

procedure TFrmTransfLocaisEstoque.FormShow(Sender: TObject);
begin
  inherited;
  panel3.Enabled:= false;
  panel4.Enabled:= false;

  if tag = 0 then
     begin
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
             BuscaLocaisDefault;
             Edtdata.SetFocus;
           end;
     end
  else
     if tag = 1 then
        Botoes('G');
end;

procedure TFrmTransfLocaisEstoque.BtnGravarClick(Sender: TObject);
begin
  inherited;
    if (not DM.Acesso('M014','I')) then
     begin
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;

  if (trim(EdtCodOrigem.Text) = '') or (trim(EdtCodDestino.Text) = '') then
     begin
        AlertaCad('Verifique os campos obrigatórios');
//        EdtCodOrigem.SetFocus;
        exit;
     end;

  if trim(EdtCodOrigem.Text) = trim(EdtCodDestino.Text) then
     begin
        AlertaCad('Local de Estoque de Origem igual o de Destino');
//        EdtCodOrigem.SetFocus;
        exit;
     end;

  if IBTRTransf.Active then
     IBTRTransf.Commit;
  IBTRTransf.StartTransaction;
  try
    try
      with QInsert do
         begin
            close;
            Parambyname('data').AsDate              := strtodate(EdtData.Text);
            Parambyname('codigo_origem').AsInteger  := strtoint(EdtCodOrigem.Text);
            Parambyname('codigo_destino').AsInteger := strtoint(EdtCodDestino.Text);
            Parambyname('cod_usu').AsInteger        := iCodUsu;
            Parambyname('cod_emp').AsInteger        := iEmp;
            Open;
            EdtCodigo.Text:= QInsertCODIGO.AsString;
         end;
      IBTRTransf.Commit;
      Botoes('G');
      panel3.Enabled:= false;
      panel4.Enabled:= true;
      EdtCodPro.SetFocus;
    except
      IBTRTransf.Rollback;
      AlertaCad('Erro ao Gravar o Lançamento');
      panel3.Enabled:= true;
      panel4.Enabled:= false;
    end;
  finally
     IBSQLTransf.Close;
  end;
end;

procedure TFrmTransfLocaisEstoque.BtnCancelarClick(Sender: TObject);
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

procedure TFrmTransfLocaisEstoque.BtnExcluirClick(Sender: TObject);
begin
  inherited;
  ToolBar1.SetFocus;
  if not DM.Acesso('M014','E') then
     begin
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;

  if Application.MessageBox('Confirma a Exclusão do Lançamento?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
     begin
        if IBTRTransf.Active then
           IBTRTransf.Commit;
        QBuscaItens.Close;
        IBTRTransf.StartTransaction;
        try
          try
            with IBSQLTransf do
               begin
                  close;
                  sql.Clear;
                  sql.Add('DELETE FROM TRANSFERENCIA_LOCAL_ESTOQUE WHERE CODIGO = :CODIGO');
                  Parambyname('codigo').AsInteger:= strtoint(EdtCodigo.Text);
                  ExecOrOpen;
               end;
            IBTRTransf.Commit;
            panel3.Enabled:= false;
            panel4.Enabled:= false;
            Botoes('E');
          except
            IBTRTransf.Rollback;
            AlertaCad('Erro ao Excluir o Lançamento');
          end;
        finally
          IBSQLTransf.Close;
        end;
     end;
end;

procedure TFrmTransfLocaisEstoque.BtnGravaClick(Sender: TObject);
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

  if IBTRTransf.Active then
     IBTRTransf.Commit;
  IBTRTransf.StartTransaction;
  try
    try
      with IBSQLTransf do
         begin
            close;
            sql.Clear;
            sql.Text:= 'INSERT INTO ITENS_TRANSF_LOCAIS_ESTOQUE (CODIGO, ORDEM, COD_PRO, QUANT, COD_EMP, ' +
                       'CODIGO_LOCAL_ORIGEM, CODIGO_LOCAL_DESTINO) ' +
                       'VALUES(:COD, :ORDEM, :CODPRO, :QUANT, :CODEMP, :ORIGEM, :DESTINO)';

            parambyname('cod').AsInteger     := strtoint(EdtCodigo.Text);
            Parambyname('ordem').AsInteger   := ordem;
            parambyname('codpro').AsInteger  := strtoint(EdtCodPro.Text);
            parambyname('quant').AsCurrency  := StrToCurr(EdtQuant.Text);
            Parambyname('codemp').AsInteger  := iEmp;
            Parambyname('origem').AsInteger  := strtoint(EdtCodOrigem.Text);
            Parambyname('destino').AsInteger := strtoint(EdtCodDestino.Text);
            ExecOrOpen;
         end;
      IBTRTransf.Commit;
    except
      IBTRTransf.Rollback;
      AlertaCad('Erro ao Gravar o Item');
    end;
  finally
    IBSQLTransf.Close;
    LimpaItens;
    BuscaItens;
    edtcodpro.SetFocus;
  end;
end;

procedure TFrmTransfLocaisEstoque.BtnExcluiClick(Sender: TObject);
var iAuxOrdem : integer;
begin
  inherited;
  if Application.MessageBox('Confirma a Exclusão do Item?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
     begin
        iAuxOrdem:= QBuscaItensORDEM.AsInteger;

        if IBTRTransf.Active then
           IBTRTransf.Commit;
        QBuscaItens.Close;
        IBTRTransf.StartTransaction;
        try
          try
            with IBSQLTransf do
               begin
                  close;
                  sql.Clear;
                  sql.Add('DELETE FROM ITENS_TRANSF_LOCAIS_ESTOQUE ' +
                          'WHERE CODIGO = :COD AND ORDEM = :ORDEM');
                  Parambyname('cod').AsInteger   := strtoint(EdtCodigo.text);
                  Parambyname('ordem').AsInteger := iAuxOrdem;
                  ExecOrOpen;
               end;
            IBTRTransf.Commit;
          except
            IBTRTransf.Rollback;
            AlertaCad('Erro ao Excluir o Item');
          end;
        finally
          IBSQLTransf.Close;
          LimpaItens;
          BuscaItens;
        end;
     end;
end;

end.

