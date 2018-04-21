unit URegistroProducao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, Grids, DBGrids, StdCtrls, Buttons, Mask, ComCtrls, ToolWin,
  ExtCtrls, DB, rxToolEdit, rxCurrEdit, UNovosComponentes, UNovoFormulario,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util,
  FireDAC.Comp.Client, FireDAC.Comp.Script, FireDAC.Comp.DataSet, cxPC,
  cxGraphics, sSpeedButton, System.ImageList;

type
  TFrmRegistroProducao = class(UNovoFormulario.TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    Panel5: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    EdtCodigo: UNovosComponentes.TEdit;
    EdtData: TDateTimePicker;
    Panel6: TPanel;
    Label5: TLabel;
    Label10: TLabel;
    BtnConsPro: TsSpeedButton;
    BtnAddPro: TsSpeedButton;
    Label11: TLabel;
    Label30: TLabel;
    EdtQuant: TCurrencyEdit;
    EdtNomePro: TEdit;
    BtnGrava: TBitBtn;
    BtnExclui: TBitBtn;
    EdtCodPro: UNovosComponentes.TEdit;
    Panel7: TPanel;
    DBGrid1: TDBGrid;
    ImageList: TImageList;
    IBTRRP: TFDTransaction;
    IBSQLRP: TFDQuery;
    QOrdem: TFDQuery;
    QOrdemORDEM: TIntegerField;
    QBuscaItens: TFDQuery;
    DSQBuscaItens: TDataSource;
    QBuscaItensCODIGO: TIntegerField;
    QBuscaItensORDEM: TIntegerField;
    QBuscaItensCOD_PRO: TIntegerField;
    QBuscaItensQUANT: TBCDField;
    QBuscaItensCOD_EMP: TIntegerField;
    QBuscaItensNOME_PRO: TStringField;
    QInsert: TFDQuery;
    QInsertCODIGO: TIntegerField;
    EdtCodLocal: UNovosComponentes.TEdit;
    BtnConsLocal: TsSpeedButton;
    EdtNomeLocal: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    ImageList2: TImageList;
    ToolBar1: TToolBar;
    BtnNovo: TToolButton;
    BtnGravar: TToolButton;
    BtnCancelar: TToolButton;
    BtnAlterar: TToolButton;
    BtnExcluir: TToolButton;
    ToolButton6: TToolButton;
    BtnConsultar: TToolButton;
    BtnSair: TToolButton;
    BarraMenu: TcxImageList;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtCodProEnter(Sender: TObject);
    procedure EdtCodProExit(Sender: TObject);
    procedure EdtCodProKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsProClick(Sender: TObject);
    procedure BtnAddProClick(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
    procedure BuscaItens;
    function  Ordem : integer;
    procedure LimpaItens;
    procedure BtnExcluiClick(Sender: TObject);
    procedure Botoes(acao : string);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnConsultarClick(Sender: TObject);
    procedure EdtCodLocalEnter(Sender: TObject);
    procedure EdtCodLocalExit(Sender: TObject);
    procedure EdtCodLocalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodLocalKeyPress(Sender: TObject; var Key: Char);
    procedure BtnConsLocalClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 function FrmRegistroProducao: TFrmRegistroProducao;

implementation
uses
  Udm, Ubibli1, UConsProd, UCadProduto, UConsRegistroProducao,
  UConsLocaisEstoque, UNovoPrincipal, UPrincipal;
var  bGrava : boolean;

{$R *.dfm}

function FrmRegistroProducao: TFrmRegistroProducao;
begin
   Result := TFrmRegistroProducao( BuscaFormulario( TFrmRegistroProducao, False ) );
end;

procedure TFrmRegistroProducao.Botoes(acao : string);
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
                Limpaedit(FrmRegistroProducao);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled:= true;
          BtnConsultar.Enabled:= false;
      end
   else
      begin
         if not (acao = 'G') then
            Limpaedit(FrmRegistroProducao);
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

procedure TFrmRegistroProducao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if IBTRRP.Active then
      IBTRRP.Commit;
   QBuscaItens.Close;
   Action:= caFree;
end;

procedure TFrmRegistroProducao.EdtCodProEnter(Sender: TObject);
begin
   edtcodpro.SelectAll;
end;

procedure TFrmRegistroProducao.EdtCodProExit(Sender: TObject);
begin
   if (edtcodpro.Text = '') or (ToolBar1.Focused) or (DBGrid1.Focused) then
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
                 sql.add('SELECT COD_PRO, NOME_PRO ' +
                         'FROM PRODUTO WHERE CODIGO_BARRA_PRO = ' + #39 + Trim(EdtCodPro.Text) + #39);
              end
           else
              begin
                 sql.add('SELECT COD_PRO, NOME_PRO ' +
                         'FROM PRODUTO WHERE COD_PRO = :CODPRO');
                 Parambyname('codpro').AsInteger:= strtoint(EdtCodPro.Text);
              end;
           Open;
           if not FieldByName('cod_pro').IsNull then
              begin
                 EdtCodPro.Text := fieldbyname('cod_pro').AsString;
                 EdtNomePro.Text:= fieldbyname('nome_pro').AsString;
                 EdtQuant.SetFocus;
              end
           else
              begin
                 LimpaItens;
                 AlertaCad('Produto não Cadastrado');
              end;
        end;
      dm.IBTransaction.Commit;
    except
      dm.IBTransaction.Rollback;
      AlertaCad('Erro ao buscar o produto');
//      EdtCodPro.SetFocus;
    end;
  finally
    dm.QConsulta.Close;
  end;
end;

procedure TFrmRegistroProducao.EdtCodProKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = vk_f3 then
     BtnConsPro.Click
  else
     if key = vk_f2 then
        BtnAddPro.Click;
end;

procedure TFrmRegistroProducao.BtnConsProClick(Sender: TObject);
begin
   Application.CreateForm(TFrmConsProd, FrmConsProd);
   FrmConsProd.tag:= 99;
   FrmConsProd.showmodal;
end;

procedure TFrmRegistroProducao.BtnAddProClick(Sender: TObject);
begin
   BuscaFormulario( TFrmCadProduto, True  );
end;

procedure TFrmRegistroProducao.BtnGravaClick(Sender: TObject);
begin
   if trim(EdtCodPro.Text)= '' then
     begin
        AlertaCad('Digite o código do produto');
//        EdtCodPro.SetFocus;
        exit;
     end;

  if edtquant.Text = '0' then
     begin
        AlertaCad('Digite a quantidade');
//        edtquant.SetFocus;
        exit;
     end;

  if IBTRRP.Active then
     IBTRRP.Commit;
  IBTRRP.StartTransaction;
  try
    try
      with IBSQLRP do
         begin
            close;
            sql.Clear;
            sql.Text:= 'INSERT INTO ITENS_REGISTRO_PRODUCAO (CODIGO, ORDEM, COD_PRO, QUANT, COD_EMP, CODIGO_LOCAL_ESTOQUE) ' +
                       'VALUES (:1, :2, :3, :4, :5, :6)';

            parambyname('1').AsInteger    := strtoint(EdtCodigo.Text);
            parambyname('2').AsInteger    := ordem;
            Parambyname('3').AsInteger    := strtoint(EdtCodPro.Text);
            parambyname('4').AsCurrency   := strtocurr(EdtQuant.Text);
            Parambyname('5').AsInteger    := iEmp;
            Parambyname('6').AsInteger    := strtoint(EdtCodLocal.Text);
            ExecOrOpen;
         end;
      IBTRRP.Commit;
    except
      IBTRRP.Rollback;
      AlertaCad('Erro ao Gravar o Item');
    end;
  finally
    IBSQLRP.Close;
    LimpaItens;
    BuscaItens;
  end;
end;

procedure TFrmRegistroProducao.LimpaItens;
begin
   edtcodpro.Clear;
   edtnomepro.Clear;
   edtquant.Text:= '1';
   EdtCodPro.SetFocus;
end;

function TFrmRegistroProducao.Ordem : integer;
begin
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with QOrdem do
      begin
         close;
         Parambyname('codigo').AsInteger:= strtoint(edtcodigo.Text);
         Open;
         result:= QOrdemORDEM.AsInteger + 1;
      end;
   dm.IBTransaction.Commit;
   QOrdem.Close;
end;

procedure TFrmRegistroProducao.BuscaItens;
begin
   if IBTRRP.Active then
      IBTRRP.Commit;
   IBTRRP.StartTransaction;
   with QBuscaItens do
      begin
         close;
         Parambyname('codigo').AsInteger:= strtoint(EdtCodigo.Text);
         open;
         Last;
      end;
end;

procedure TFrmRegistroProducao.BtnExcluiClick(Sender: TObject);
var iOrdem : integer;
begin
   iOrdem:= QBuscaItensORDEM.AsInteger;
   if Application.MessageBox('Confirma a Exclusão do Item?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
      begin
         try
           try
             if IBTRRP.Active then
                IBTRRP.Commit;
             IBTRRP.StartTransaction;
             with IBSQLRP do
                begin
                   close;
                   sql.Clear;
                   sql.Text:= 'DELETE FROM ITENS_REGISTRO_PRODUCAO ' +
                              'CODIGO = :CODIGO AND ORDEM = :ORDEM';
                   Parambyname('codigo').AsInteger := strtoint(EdtCodigo.Text);
                   Parambyname('ordem').AsInteger  := iOrdem;
                   ExecOrOpen;
                end;
             IBTRRP.Commit;
           except
             IBTRRP.Rollback;
             AlertaCad('Erro ao Excluir o Item');
           end;
         finally
           IBSQLRP.Close;
           LimpaItens;
           BuscaItens;
         end;
      end;
end;

procedure TFrmRegistroProducao.BtnNovoClick(Sender: TObject);
begin
   ToolBar1.SetFocus;
  if IBTRRP.Active then
     IBTRRP.Commit;
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
  Edtdata.SetFocus;
end;

procedure TFrmRegistroProducao.BtnGravarClick(Sender: TObject);
begin
   if (bGrava) and (not DM.Acesso('M012','I')) then
     begin
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  if not panel5.Enabled then
     begin
        AlertaCad('Registro gravado');
        exit;
     end;

  if bGrava then
     begin
        if IBTRRP.Active then
           IBTRRP.Commit;
        IBTRRP.StartTransaction;
        try
          try
            with QInsert do
               begin
                  close;
                  Parambyname('data').AsDate        := EdtData.Date;
                  Parambyname('codemp').AsInteger   := iEmp;
                  Parambyname('codlocal').AsInteger := strtoint(EdtCodLocal.Text);
                  Open;
                  EdtCodigo.Text:= QInsertCODIGO.AsString;
               end;
            IBTRRP.Commit;
            Botoes('G');
            panel5.Enabled:= false;
            panel6.Enabled:= true;
          except
            IBTRRP.Rollback;
            AlertaCad('Erro ao Gravar o Registro');
            panel5.Enabled:= false;
            panel6.Enabled:= true;
          end;
        finally
          QInsert.Close;
          btngrava.Enabled   := true;
          btnexclui.Enabled  := true;
        end;
     end
  else
     begin
        if IBTRRP.Active then
           IBTRRP.Commit;
        IBTRRP.StartTransaction;
        try
          try
            with IBSQLRP do
               begin
                  close;
                  sql.Clear;
                  sql.Text:= 'UPDATE REGISTRO_PRODUCAO ' +
                             'SET DATA = :DATA ' +
                             'WHERE CODIGO = :CODIGO';
                  Parambyname('codigo').AsInteger   := strtoint(EdtCodigo.Text);
                  Parambyname('data').AsDate        := EdtData.Date;
                  ExecOrOpen;
               end;
            IBTRRP.Commit;
            panel5.Enabled:= false;
            panel6.Enabled:= true;
            Botoes('G');
          except
            IBTRRP.Rollback;
            AlertaCad('Erro ao Gravar o Registro');
          end;
        finally
          IBSQLRP.Close;
          btngrava.Enabled := true;
          btnexclui.Enabled:= true;
        end;
     end;
  BuscaItens;
  LimpaItens;
end;

procedure TFrmRegistroProducao.BtnCancelarClick(Sender: TObject);
begin
   ToolBar1.SetFocus;
  if not panel5.Enabled then
     AlertaCad('Registro Gravado')
  else
     begin
        Botoes('C');
        panel5.Enabled:= false;
        panel6.Enabled:= false;
     end;
end;

procedure TFrmRegistroProducao.BtnAlterarClick(Sender: TObject);
begin
   if not DM.Acesso('M012','A') then
     begin
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  bGrava:= false;
  panel5.Enabled     := true;
  Botoes('A');
  EdtCodLocal.Enabled  := false;
  EdtNomeLocal.Enabled := false;
  BtnConsLocal.Enabled := false;
  edtdata.SetFocus;
end;

procedure TFrmRegistroProducao.BtnExcluirClick(Sender: TObject);
begin
   ToolBar1.SetFocus;
  if not DM.Acesso('M012','E') then
     begin
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  if Application.MessageBox('Confirma a Exclusão do Registro?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
     begin
        if IBTRRP.Active then
           IBTRRP.Commit;
        QBuscaItens.Close;
        IBTRRP.StartTransaction;
        try
          try
            with IBSQLRP do
               begin
                  close;
                  sql.Clear;
                  sql.Text:= 'DELETE FROM REGISTRO_PRODUCAO ' +
                             'WHERE CODIGO = :CODIGO';
                  Parambyname('codigo').AsInteger:= strtoint(EdtCodigo.Text);
                  ExecOrOpen;
               end;
            IBTRRP.Commit;
            panel5.Enabled:= false;
            panel6.Enabled:= false;
            Botoes('E');
          except
            IBTRRP.Rollback;
            AlertaCad('Erro ao Excluir o Registro');
          end;
        finally
          IBSQLRP.Close;
        end;
     end;
end;

procedure TFrmRegistroProducao.FormShow(Sender: TObject);
begin
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

procedure TFrmRegistroProducao.BtnSairClick(Sender: TObject);
begin
   if Parent is TcxTabSheet then
      frmMenu.FTDI.CloseTabOfForm( TFormClass( Self.ClassType ) )
   else
      close;
end;

procedure TFrmRegistroProducao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
     vk_escape : BtnSair.Click;
     vk_f3: begin
               if (BtnConsultar.Enabled) and (BtnNovo.Enabled) then
                  BtnConsultar.Click;
            end;
     vk_f5: begin
               if btnnovo.Enabled then
                  btnnovo.Click;
            end;
     vk_f6: begin
               if btngravar.Enabled then
                  btngravar.Click;
            end;
     vk_f7: begin
               if btncancelar.Enabled then
                  btncancelar.Click;
            end;
     vk_f8: begin
               if btnalterar.Enabled then
                  btnalterar.Click;
            end;
     vk_f9: begin
               if btnexcluir.Enabled then
                  btnexcluir.Click;
            end;
   end;
end;

procedure TFrmRegistroProducao.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
      begin
         key:= #0;
         SelectNext(ActiveControl, true, true);
      end;
end;

procedure TFrmRegistroProducao.BtnConsultarClick(Sender: TObject);
begin
   Application.CreateForm(TFrmConsRegistroProducao, FrmConsRegistroProducao);
   FrmConsRegistroProducao.tag:= 0;
   FrmConsRegistroProducao.showmodal;
end;

procedure TFrmRegistroProducao.EdtCodLocalEnter(Sender: TObject);
begin
   EdtCodLocal.SelectAll;
end;

procedure TFrmRegistroProducao.EdtCodLocalExit(Sender: TObject);
begin
   if ToolBar1.Focused then
     exit;

  EdtNomeLocal.Text:= consulta('locais_estoque', EdtCodLocal, 'codigo', 'descricao', dm.IBTransaction, dm.qConsulta);
  if trim(EdtNomeLocal.Text) = '' then
     begin
        AlertaCad('Local de Estoque não Cadastrado');
//        EdtCodLocal.SetFocus;
     end;
end;

procedure TFrmRegistroProducao.EdtCodLocalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key = vk_f3 then
     BtnConsLocal.Click;
end;

procedure TFrmRegistroProducao.EdtCodLocalKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmRegistroProducao.BtnConsLocalClick(Sender: TObject);
begin
   Application.CreateForm(TFrmConsLocaisEstoque, FrmConsLocaisEstoque);
   FrmConsLocaisEstoque.Tag:= 5;
   FrmConsLocaisEstoque.ShowModal;
end;

end.



