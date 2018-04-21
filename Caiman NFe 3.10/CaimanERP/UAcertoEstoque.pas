unit UAcertoEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, Buttons, ExtCtrls, ComCtrls, StdCtrls, Mask, Grids, 
  DBGrids, DB, ImgList, ToolWin, rxToolEdit, rxCurrEdit, acAlphaImageList, 
  UNovosComponentes, UNovoFormulario, cxGraphics, cxControls, cxLookAndFeels, 
  cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, 
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White, 
  dxSkinsdxStatusBarPainter, dxStatusBar, dxSkinMetropolisDark, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, 
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, 
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton;

type
  TFrmAcertoEstoque = class(TFrmCadastroNovo)
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Label1: TLabel;
    cod_ace: UNovosComponentes.TEdit;
    Label2: TLabel;
    EdtData: TDateTimePicker;
    Label21: TLabel;
    EdtCodMot: UNovosComponentes.TEdit;
    BtnConsMot: TsSpeedButton;
    BtnAddMot: TsSpeedButton;
    EdtNomeMot: TEdit;
    Label22: TLabel;
    Label5: TLabel;
    EdtQuant: TCurrencyEdit;
    Label10: TLabel;
    BtnConsPro: TsSpeedButton;
    BtnAddPro: TsSpeedButton;
    EdtNomePro: TEdit;
    Label11: TLabel;
    Label30: TLabel;
    BtnGrava: TBitBtn;
    BtnExclui: TBitBtn;
    DBGrid1: TDBGrid;
    QInsAce: TFDQuery;
    QUpdAce: TFDQuery;
    QDelAce: TFDQuery;
    IBTRAce: TFDTransaction;
    QBuscaItens: TFDQuery;
    QBuscaItensCOD_ACE: TIntegerField;
    QBuscaItensCOD_PRO: TIntegerField;
    QBuscaItensCOD_MOT: TIntegerField;
    QBuscaItensQUANT: TBCDField;
    QBuscaItensCOD_EMP: TIntegerField;
    DSQBuscaItens: TDataSource;
    InsItem: TFDQuery;
    DelItem: TFDQuery;
    QBuscaItensNOME_PRO: TStringField;
    MemoOBS: TMemo;
    Label3: TLabel;
    QOrdem: TFDQuery;
    QOrdemORDEM: TIntegerField;
    QBuscaItensORDEM: TIntegerField;
    EdtCodPro: UNovosComponentes.TEdit;
    QBuscaItensVALOR_CUSTO: TBCDField;
    Label4: TLabel;
    EdtEstoque: TCurrencyEdit;
    PanelPB: TPanel;
    PB: TProgressBar;
    BtnColetor: TButton;
    OP: TOpenDialog;
    QInsColetor: TFDQuery;
    EdtCodLocal: UNovosComponentes.TEdit;
    BtnConsLocal: TsSpeedButton;
    EdtNomeLocal: TEdit;
    BtnAddLocal: TsSpeedButton;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    EdtDataValidade: TMaskEdit;
    CheckFator: TCheckBox;
    Label9: TLabel;
    QuantEnt: TCurrencyEdit;
    Label12: TLabel;
    procedure EdtCodMotKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodMotExit(Sender: TObject);
    procedure BtnAddMotClick(Sender: TObject);
    procedure BtnConsMotClick(Sender: TObject);
    procedure EdtCodMotKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsProClick(Sender: TObject);
    procedure BtnAddProClick(Sender: TObject);
    procedure EdtCodProKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodProExit(Sender: TObject);
    procedure EdtCodMotEnter(Sender: TObject);
    procedure EdtCodProEnter(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BuscaItens;
    procedure FormShow(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
    procedure LimpaItens;
    procedure BtnExcluiClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure Botoes(acao : string);
    procedure MemoOBSEnter(Sender: TObject);
    procedure MemoOBSExit(Sender: TObject);
    procedure MemoOBSKeyPress(Sender: TObject; var Key: Char);
    function  Ordem : integer;
    procedure FormCreate(Sender: TObject);
    procedure BtnColetorClick(Sender: TObject);
    procedure GravaItensColetor(const CodProd : integer; const Quant : currency;
          const Valor : currency);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtCodLocalEnter(Sender: TObject);
    procedure EdtCodLocalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodLocalExit(Sender: TObject);
    procedure BtnConsLocalClick(Sender: TObject);
    procedure BtnAddLocalClick(Sender: TObject);
    procedure EdtDataValidadeExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 function FrmAcertoEstoque: TFrmAcertoEstoque;

implementation
uses
  Udm, Ubibli1, UCadMotivo, UConsMotivo, UConsProd, UCadProduto, 
  UConsAcertoEstoque, UConsLocaisEstoque, UCadLocaisEstoque, UNovoPrincipal, 
  UPrincipal;
var  bGrava    : boolean;

{$R *.dfm}

function FrmAcertoEstoque: TFrmAcertoEstoque;
begin
   Result := TFrmAcertoEstoque( BuscaFormulario( TFrmAcertoEstoque, False ) );
end;

procedure TFrmAcertoEstoque.Botoes(acao : string);
begin 
   {(N)OVO
    (G)RAVAR
    (C)ANCELAR
    (A)LTERAR
    (E)EXCLUIR
    (P)ESQUISAR/CONSULTAR }

   if (acao = 'N') or (acao = 'A') then
      begin 
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmAcertoEstoque);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled:= true;
          BtnConsultar.Enabled:= false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmAcertoEstoque);
         btnNovo.Enabled      := true;
         BtnGravar.Enabled    := false;
         btnCancelar.Enabled  := false;
         if (acao = 'C') or (acao = 'E') then
            begin 
               btnalterar.Enabled   := false;
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

procedure TFrmAcertoEstoque.GravaItensColetor(const CodProd : integer; const Quant : currency;
          const Valor : currency);
var iOrd : integer;
begin 
   iOrd:= Ordem;
   if IBTRAce.Active then
      IBTRAce.Commit;
   IBTRAce.StartTransaction;
   with QInsColetor do
      begin 
         close;
         Parambyname('codace').AsInteger      := strtoint(cod_ace.Text);
         Parambyname('codemp').AsInteger      := iEmp;
         Parambyname('codmot').AsInteger      := strtoint(EdtCodMot.Text);
         Parambyname('codpro').AsInteger      := CodProd;
         Parambyname('ordem').AsInteger       := iOrd;
         Parambyname('quant').AsCurrency      := Quant;
         Parambyname('custo').AsCurrency      := 0;
         ExecOrOpen;
      end;
   IBTRAce.Commit;
   QInsColetor.Close;
end;

procedure TFrmAcertoEstoque.LimpaItens;
begin 
   EdtEstoque.Clear;
   edtcodpro.Clear;
   edtnomepro.Clear;
   edtquant.Text:= '1';
   EdtDataValidade.Clear;
   EdtCodPro.SetFocus;
end;

function TFrmAcertoEstoque.Ordem : integer;
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QOrdem do
      begin 
         close;
         Parambyname('codace').Value  := cod_ace.Text;
         Open;
         result:= QOrdemORDEM.Value + 1;
      end;
   dm.IBTransaction.Commit;
   QOrdem.Close;
end;

procedure TFrmAcertoEstoque.BuscaItens;
begin 
   if IBTRAce.Active then
      IBTRAce.Commit;
   IBTRAce.StartTransaction;
   with QBuscaItens do
      begin 
         close;
         Parambyname('codace').AsInteger:= strtoint(cod_ace.Text);
         open;
         Last;
      end;
   IBTRAce.CommitRetaining;
end;

procedure TFrmAcertoEstoque.EdtCodMotKeyPress(Sender: TObject;
  var Key: Char);
begin 
  inherited;
  if not (key in ['0'..'9', #13, #8]) then
     key:= #0;
end;

procedure TFrmAcertoEstoque.EdtCodMotExit(Sender: TObject);
begin 
  inherited;
  if toolbar1.focused then
     exit;
  EdtNomeMot.Text:= consulta('motivo_acerto', edtcodmot, 'cod_mot', 'nome_mot', dm.IBTransaction, dm.qConsulta);
  if edtnomemot.Text = '' then
     begin 
        AlertaCad('Motivo de Acerto não Cadastrado');
////        edtcodmot.SetFocus;
     end;
end;

procedure TFrmAcertoEstoque.BtnAddMotClick(Sender: TObject);
begin 
  inherited;
  BuscaFormulario( TFrmCadMotivo, True );
end;

procedure TFrmAcertoEstoque.BtnConsMotClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsMotivo, FrmConsMotivo);
  FrmConsMotivo.Tag:= 2;
  FrmConsMotivo.ShowModal;
end;

procedure TFrmAcertoEstoque.EdtCodMotKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     BtnConsMot.Click
  else
    if key = vk_f2 then
       BtnAddMot.Click;
end;

procedure TFrmAcertoEstoque.BtnConsProClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsProd, FrmConsProd);
  FrmConsProd.tag:= 4;
  FrmConsProd.showmodal;
end;

procedure TFrmAcertoEstoque.BtnAddProClick(Sender: TObject);
begin 
  inherited;
  BuscaFormulario( TFrmCadProduto, True );
end;

procedure TFrmAcertoEstoque.EdtCodProKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     BtnConsPro.Click
  else
     if key = vk_f2 then
        BtnAddPro.Click;
end;

procedure TFrmAcertoEstoque.EdtCodProExit(Sender: TObject);
var bAux : boolean;
begin 
  inherited;
  if (edtcodpro.Text = '') or (ToolBar1.Focused) or (DBGrid1.Focused) or (BtnColetor.Focused) then
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
           if length(trim(EdtCodPro.Text)) > 7 then
              begin 
                 sql.add('SELECT COD_PRO, NOME_PRO, DATA_VALIDADE, QUANT_UNIDADE_ENTRADA ' +
                         'FROM PRODUTO WHERE CODIGO_BARRA_PRO = ' + #39 + Trim(EdtCodPro.Text) + #39);
              end
           else
              begin 
                 sql.add('SELECT COD_PRO, NOME_PRO, DATA_VALIDADE, QUANT_UNIDADE_ENTRADA ' +
                         'FROM PRODUTO WHERE COD_PRO = :CODPRO');
                 Parambyname('codpro').AsInteger:= strtoint(EdtCodPro.Text);
              end;
           Open;
           if not FieldByName('cod_pro').IsNull then
              begin 
                 bAux:= true;
                 EdtCodPro.Text       := fieldbyname('cod_pro').AsString;
                 EdtNomePro.Text      := fieldbyname('nome_pro').AsString;
                 EdtDataValidade.Text := fieldbyname('data_validade').AsString;
                 QuantEnt.Text        := fieldbyname('QUANT_UNIDADE_ENTRADA').AsString;
                 EdtQuant.SetFocus;
              end
           else
              begin 
                 bAux:= false;
                 LimpaItens;
                 AlertaCad('Produto não Cadastrado');
              end;
        end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      bAux:= false;
      AlertaCad('Erro ao buscar o produto');
//      EdtCodPro.SetFocus;
    end;
  finally
    dm.QConsulta.Close;
  end;

  if bAux then
     EdtEstoque.Text:= currtostr(dm.BuscaEstoqueProduto(strtoint(EdtCodPro.Text), iEmp));
end;

procedure TFrmAcertoEstoque.EdtCodMotEnter(Sender: TObject);
begin 
  inherited;
  edtcodmot.SelectAll;
end;

procedure TFrmAcertoEstoque.EdtCodProEnter(Sender: TObject);
begin 
  inherited;
  edtcodpro.SelectAll;
end;

procedure TFrmAcertoEstoque.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if (bGrava) and (not DM.Acesso('M012','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  if not panel5.Enabled then
     begin 
        AlertaCad('Acerto já gravado');
        exit;
     end;
  if edtcodmot.Text = '' then
     begin 
        AlertaCad('Digite o Motivo do Acerto');
//        edtcodmot.SetFocus;
        exit;
     end;

  if IBTRAce.Active then
     IBTRAce.Commit;
  IBTRAce.StartTransaction;
  if bGrava = true then
     begin 
        try
          try
            with QInsAce do
               begin 
                  close;
                  cod_ace.Text:= inttostr(prxcod('acerto_estoque', 'cod_ace', dm.IBTransaction, dm.ibsqlcod));
                  Parambyname('codemp').AsInteger  := iEmp;
                  Parambyname('codace').AsInteger  := strtoint(cod_ace.Text);
                  Parambyname('codmot').AsInteger  := strtoint(EdtCodMot.text);
                  Parambyname('dataace').AsDate    := EdtData.Date;
                  Parambyname('obs').AsString      := trim(MemoOBS.Text);
                  Parambyname('local').AsInteger   := strtoint(EdtCodLocal.Text);
                  ExecOrOpen;
                  panel5.Enabled:= false;
                  panel6.Enabled:= true;
               end;
            IBTRAce.Commit;
            Botoes('G');
          except
            IBTRAce.Rollback;
            AlertaCad('Erro ao Gravar o Acerto');
            panel5.Enabled:= false;
            panel6.Enabled:= true;
          end;
        finally
          QInsAce.Close;
          btngrava.Enabled   := true;
          btnexclui.Enabled  := true;
        end;
     end
  else
     begin 
        try
          try
            with QUpdAce do
               begin 
                  close;
                  Parambyname('codace').AsInteger  := strtoint(cod_ace.Text);
                  Parambyname('dataace').AsDate    := EdtData.Date;
                  Parambyname('obs').AsString      := trim(MemoOBS.Text);
                  ExecOrOpen;
               end;
            IBTRAce.Commit;
            panel5.Enabled:= false;
            panel6.Enabled:= true;
            Botoes('G');
          except
            IBTRAce.Rollback;
            AlertaCad('Erro ao Gravar o Acerto');
          end;
        finally
          QUpdAce.Close;
          btngrava.Enabled := true;
          btnexclui.Enabled:= true;
        end;
     end;
  BuscaItens;
  LimpaItens;
end;

procedure TFrmAcertoEstoque.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  ToolBar1.SetFocus;
  if IBTRAce.Active then
     IBTRAce.Commit;
  QBuscaItens.Close;
  bGrava:= true;
  if not DM.Acesso('M012','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        panel5.Enabled:= false;
        panel6.Enabled:= false;
        Abort;
        Exit;
     end;
  Botoes('N');
  panel5.Enabled     := true;
  panel6.Enabled     := false;
  EdtData.Date       := date;
  btngrava.Enabled   := false;
  btnexclui.Enabled  := false;

  edtcodmot.Enabled  := true;
  BtnConsMot.Enabled := true;
  BtnAddMot.Enabled  := true;

  Edtdata.SetFocus;
end;

procedure TFrmAcertoEstoque.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  ToolBar1.SetFocus;
  if not panel5.Enabled then
     AlertaCad('Acerto já foi gravado')
  else
     begin 
        Botoes('C');
        panel5.Enabled:= false;
        panel6.Enabled:= false;
     end;
end;

procedure TFrmAcertoEstoque.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('M012','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  bGrava:= false;
  panel5.Enabled       := true;

  edtcodmot.Enabled    := false;
  BtnConsMot.Enabled   := false;
  BtnAddMot.Enabled    := false;
  EdtCodLocal.Enabled  := false;
  BtnConsLocal.Enabled := false;
  BtnAddLocal.Enabled  := false;

  Botoes('A');
  edtdata.SetFocus;
end;

procedure TFrmAcertoEstoque.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  ToolBar1.SetFocus;
  if not DM.Acesso('M012','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;

  if Application.MessageBox('Confirma a Exclusão do Acerto?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
     begin 
        if IBTRAce.Active then
           IBTRAce.Commit;
        QBuscaItens.Close;
        IBTRAce.StartTransaction;
        try
          try
            with QDelAce do
               begin 
                  close;
                  Parambyname('codace').AsInteger:= strtoint(cod_ace.Text);
                  ExecOrOpen;
               end;
            IBTRAce.Commit;
            panel5.Enabled:= false;
            panel6.Enabled:= false;
            Botoes('E');
          except
            IBTRAce.Rollback;
            AlertaCad('Erro ao Excluir o Acerto');
         end;
        finally
          QDelAce.Close;
        end;
     end;
end;

procedure TFrmAcertoEstoque.FormShow(Sender: TObject);
begin 
  inherited;
  panel5.Enabled   := false;
  panel6.Enabled   := false;
  if tag = 0 then
     begin 
        bGrava:= true;
        if not DM.Acesso('M012','I') then
           begin 
             Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
             Botoes('C');
           end
        else
           begin 
             Botoes('N');
             panel5.Enabled   := true;
             Edtdata.Date     := date;
             btngrava.Enabled := false;
             btnexclui.Enabled:= false;

             edtcodmot.Enabled  := true;
             BtnConsMot.Enabled := true;
             BtnAddMot.Enabled  := true;

             Edtdata.SetFocus;
           end;
     end
  else
     if tag = 1 then
        begin 
           Botoes('G');
           btngrava.Enabled := true;
           btnexclui.Enabled:= true;
        end;
end;

procedure TFrmAcertoEstoque.BtnGravaClick(Sender: TObject);
var cPrecoCusto : currency;

procedure AtualizaDataValidade;
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with dm.QConsulta do
      begin 
         close;
         sql.Clear;
         sql.Text:= 'UPDATE PRODUTO SET DATA_VALIDADE = :DATA ' +
                    'WHERE COD_PRO = :CODPRO';

         if EdtDataValidade.Text = '  /  /    ' then
            Parambyname('data').Value     := null
         else
            Parambyname('data').AsDate    := strtodate(EdtDataValidade.Text);

         Parambyname('codpro').AsInteger  := strtoint(EdtCodPro.Text);
         ExecOrOpen;
      end;
   dm.IBTransaction.Commit;
   dm.QConsulta.Close;
end;

begin 
  inherited;
  cPrecoCusto:= 0;
  if edtquant.Text = '0' then
     begin 
        AlertaCad('Digite a quantidade');
//        edtquant.SetFocus;
        exit;
     end;

  { BUSCA O CUSTO DO PRODUTO }
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  try
    try
      with dm.Consulta do
         begin 
            close;
            sql.Clear;
            sql.add('SELECT PRECO_CUSTO FROM PRODUTO WHERE COD_PRO = :CODPRO');
            Parambyname('codpro').AsInteger:= strtoint(EdtCodPro.Text);
            ExecOrOpen;
            cPrecoCusto:= fieldbyname('preco_custo').AsCurrency;
         end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.StartTransaction;
      AlertaCad('Erro ao buscar o custo do produto');
    end;
  finally
    dm.Consulta.Close;
  end;

  if IBTRAce.Active then
     IBTRAce.Commit;
  IBTRAce.StartTransaction;
  try
    try
      with InsItem do
         begin 
            close;
            parambyname('codace').AsInteger    := strtoint(cod_ace.Text);
            parambyname('codpro').AsInteger    := strtoint(EdtCodPro.Text);
            Parambyname('codmot').AsInteger    := strtoint(EdtCodMot.Text);
            if CheckFator.Checked then
               parambyname('quant').AsCurrency    := strtocurr(EdtQuant.Text) * strtocurr(QuantEnt.Text)
            else
               parambyname('quant').AsCurrency    := strtocurr(EdtQuant.Text);
            Parambyname('codemp').AsInteger    := iEmp;
            Parambyname('ordem').AsInteger     := ordem;
            Parambyname('custo').AsCurrency    := cPrecoCusto;
            Parambyname('local').AsInteger     := strtoint(EdtCodLocal.Text);
            ExecOrOpen;
         end;
      IBTRAce.Commit;
      atualizaDataValidade;
    except
      IBTRAce.Rollback;
      AlertaCad('Erro ao Gravar o Item, ' + #13 +
                  'Verifique que já foi lançado');
    end;
  finally
    InsItem.Close;
    LimpaItens;
    BuscaItens;
  end;
  BuscaItens;
end;

procedure TFrmAcertoEstoque.BtnExcluiClick(Sender: TObject);
var iOrdem : integer;
begin 
  inherited;
  iOrdem:= QBuscaItensORDEM.AsInteger;
  if Application.MessageBox('Confirma a Exclusão do Item?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
     begin 
        try
          try
            with DelItem do
               begin 
                  close;
                  Parambyname('codace').AsInteger := strtoint(cod_ace.text);
                  Parambyname('ordem').AsInteger  := iOrdem;
                  ExecOrOpen;
               end;
            IBTRAce.Commit;
          except
            IBTRAce.Rollback;
            AlertaCad('Erro ao Excluir o Item');
          end;
        finally
          DelItem.Close;
          LimpaItens;
          BuscaItens;
        end;
     end;
end;

procedure TFrmAcertoEstoque.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsAcertoEstoque, FrmConsAcertoEstoque);
  FrmConsAcertoEstoque.tag:= 0;
  FrmConsAcertoEstoque.showmodal;
end;

procedure TFrmAcertoEstoque.MemoOBSEnter(Sender: TObject);
begin 
  inherited;
  FrmAcertoEstoque.KeyPreview:= false;
end;

procedure TFrmAcertoEstoque.MemoOBSExit(Sender: TObject);
begin 
  inherited;
  FrmAcertoEstoque.KeyPreview:= true;
end;

procedure TFrmAcertoEstoque.MemoOBSKeyPress(Sender: TObject;
  var Key: Char);
begin 
  inherited;
  key:= UpCase(key);
end;

procedure TFrmAcertoEstoque.FormCreate(Sender: TObject);
begin 
  inherited;
     
  PanelPB.Visible:= false;
end;

procedure TFrmAcertoEstoque.BtnColetorClick(Sender: TObject);
var txt : TStrings;
    i   : integer;
    sCodBarra    : string;
    sQuant       : string;
    cQuant       : currency;
    iPosVirgula  : integer;
    iAuxCodProd  : integer;
begin 
  inherited;
  if OP.Execute then
      begin 
         if Application.MessageBox('Confirma a Importação?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
            begin 
               txt:= TStringList.Create;
               txt.LoadFromFile(OP.FileName);
               PanelPB.Visible:= true;
               pb.Max:= txt.Count;
               pb.Min:= 0;
               if txt.Count = 0 then
                  raise Exception.Create('arquivo vazio');

               for i:= 0 to txt.Count -1 do
                  begin 
                     try
                       iPosVirgula:= pos(',', txt[i]);
                       sCodBarra  := IntToStr(StrToInt64(copy(txt[i], 1, (iPosVirgula - 1))));
                       sQuant     := copy(txt[i], iPosVirgula + 1, length(txt[i]) - iPosVirgula);
                       cQuant     := StrToCurr(InverteValor(sQuant));
                       if cQuant > 0 then
                          begin 
                             {busca o produto}
                             with dm.QConsulta do
                                 begin 
                                    if dm.IBTransaction.Active then
                                       dm.IBTransaction.Commit;
                                    dm.IBTransaction.StartTransaction;

                                    close;
                                    sql.Clear;
                                    sql.Add('SELECT COD_PRO ' +
                                            'FROM PRODUTO ' +
                                            'WHERE CODIGO_BARRA_PRO = ' + #39 + sCodBarra + #39);
                                    Open;
                                    iAuxCodProd:= fieldbyname('cod_pro').AsInteger;
                                    dm.IBTransaction.Commit;
                                    close;

                                    if iAuxCodProd > 0 then
                                       begin 
                                          GravaItensColetor(iAuxCodProd, cQuant, 0);
                                       end;
                                 end;
                          end;
                     except
                     end;
                     pb.Position:= i + 1;
                  end;
               txt.Free;
               PanelPB.Visible:= false;
               LimpaItens;
               BuscaItens;
            end;
      end;
end;

procedure TFrmAcertoEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if IBTRAce.Active then
     IBTRAce.Commit;
  Action:= caFree;
end;

procedure TFrmAcertoEstoque.EdtCodLocalEnter(Sender: TObject);
begin 
  inherited;
  EdtCodLocal.SelectAll;
end;

procedure TFrmAcertoEstoque.EdtCodLocalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     BtnConsLocal.Click;
end;

procedure TFrmAcertoEstoque.EdtCodLocalExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;

  EdtNomeLocal.Text:= consulta('locais_estoque', EdtCodLocal, 'codigo', 'descricao', dm.IBTransaction, dm.qConsulta);
  if trim(EdtNomeLocal.Text) = '' then
     begin 
        AlertaCad('Local de Estoque não Cadastrado');
////        EdtCodLocal.SetFocus;
     end;
end;

procedure TFrmAcertoEstoque.BtnConsLocalClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsLocaisEstoque, FrmConsLocaisEstoque);
  FrmConsLocaisEstoque.Tag:= 2;
  FrmConsLocaisEstoque.ShowModal;
end;

procedure TFrmAcertoEstoque.BtnAddLocalClick(Sender: TObject);
begin 
  inherited;
  BuscaFormulario( TFrmCadLocaisEstoque, True );
end;

procedure TFrmAcertoEstoque.EdtDataValidadeExit(Sender: TObject);
begin 
  inherited;
  if EdtDataValidade.Text = '  /  /    ' then
     exit;

  try
    strtodate(EdtDataValidade.Text);
  except
    AlertaCad('Data inválida');
//    EdtDataValidade.SetFocus;
  end;
end;

end.
