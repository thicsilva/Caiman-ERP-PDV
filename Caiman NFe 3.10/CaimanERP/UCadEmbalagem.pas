unit UCadEmbalagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, ImgList, ComCtrls, ToolWin, ExtCtrls, Buttons, StdCtrls, 
  Mask, rxToolEdit, rxCurrEdit, UNovosComponentes, UNovoFormulario, 
  acAlphaImageList, cxGraphics, cxControls, cxLookAndFeels, 
  cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, dxSkinMetropolisDark, 
  dxSkinsdxStatusBarPainter, dxStatusBar, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton, Data.DB;

type
  TFrmCadEmbalagem = class(TFrmCadastroNovo)
    Label17: TLabel;
    EdtCodPro: TEdit;
    BtnConsPro: TsSpeedButton;
    Label18: TLabel;
    EdtNomePro: TEdit;
    BtnAddPro: TsSpeedButton;
    Label19: TLabel;
    EdtQuant: TCurrencyEdit;
    Label1: TLabel;
    codigo: TEdit;
    Label2: TLabel;
    EdtNome: TEdit;
    IBSQLEmbalagem: TFDQuery;
    IBTREmbalagem: TFDTransaction;
    Label3: TLabel;
    EdtUnidade: TEdit;
    Label4: TLabel;
    EdtCodBarra: TEdit;
    Label5: TLabel;
    edtValor: TCurrencyEdit;
    procedure BtnConsProClick(Sender: TObject);
    procedure BtnAddProClick(Sender: TObject);
    procedure EdtCodProEnter(Sender: TObject);
    procedure EdtCodProKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodProKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodProExit(Sender: TObject);
    procedure Botoes(acao : string);
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure EdtCodBarraExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function FrmCadEmbalagem: TFrmCadEmbalagem;

implementation
uses
  UDM, Ubibli1, UConsProd, UCadProduto, UConsEmbalagens, UNovoPrincipal;
var  bGrava : boolean;

{$R *.dfm}

function FrmCadEmbalagem: TFrmCadEmbalagem;
begin
   Result := TFrmCadEmbalagem( BuscaFormulario( TFrmCadEmbalagem, False ) );
end;

procedure TFrmCadEmbalagem.Botoes(acao : string);
begin
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          EDedit(FrmCadEmbalagem, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmCadEmbalagem);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmCadEmbalagem);
         EDedit(FrmCadEmbalagem, false);
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

procedure TFrmCadEmbalagem.BtnConsProClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsProd, FrmConsProd);
  FrmConsProd.Tag:= 30;
  FrmConsProd.ShowModal;
end;

procedure TFrmCadEmbalagem.BtnAddProClick(Sender: TObject);
begin 
  inherited;
//  Application.CreateForm(TFrmCadProduto, FrmCadProduto);
  FrmCadProduto.tag:= 0;
  FrmCadProduto.showmodal;
end;

procedure TFrmCadEmbalagem.EdtCodProEnter(Sender: TObject);
begin 
  inherited;
  EdtCodPro.SelectAll;
end;

procedure TFrmCadEmbalagem.EdtCodProKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     BtnConsPro.Click
  else
     if key = vk_f2 then
        BtnAddPro.Click;
end;

procedure TFrmCadEmbalagem.EdtCodProKeyPress(Sender: TObject;
  var Key: Char);
begin 
  inherited;
  if not (key in ['0'..'9', #13, #8]) then
     key:= #0; 
end;

procedure TFrmCadEmbalagem.EdtCodProExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;
  EdtNomePro.Text:= Consulta('produto', EdtCodPro, 'cod_pro', 'nome_pro', dm.IBTransaction, dm.QConsulta);
  if EdtNome.Text = '' then
     begin 
        AlertaCad('Produto não cadastrado');
//        EdtCodPro.SetFocus;
     end;
end;

procedure TFrmCadEmbalagem.FormShow(Sender: TObject);
begin 
  inherited;
  if tag = 0 then
     begin 
        bGrava:= true;
        if not DM.Acesso('C011','I') then
           begin 
             Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
             Botoes('C');
           end
        else
           begin 
             Botoes('N');
             EdtCodBarra.SetFocus;
           end;
     end
  else
     if tag = 1 then
        Botoes('G');
end;

procedure TFrmCadEmbalagem.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  bGrava:= true;
  if not DM.Acesso('C011','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  EdtCodBarra.SetFocus;
end;

procedure TFrmCadEmbalagem.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  Botoes('C');
end;

procedure TFrmCadEmbalagem.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C011','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  bGrava:= false;
  Botoes('A');
  EdtNome.SetFocus;
end;

procedure TFrmCadEmbalagem.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if (bGrava) and (not DM.Acesso('C011','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;

  if trim(edtnome.Text) = '' then
     begin 
        AlertaCad('Digite a Descrição da Embalagem');
//        edtnome.SetFocus;
        exit;
     end;

  if strtocurr(EdtQuant.Text) <= 0 then
     begin 
        AlertaCad('Digite a quantidade');
//        EdtQuant.SetFocus;
        exit;
     end;

  if IBTREmbalagem.Active then
     IBTREmbalagem.Commit;
  IBTREmbalagem.StartTransaction;
  try
    try
      with IBSQLEmbalagem do
        begin 
           close;
           sql.Clear;
           if bGrava then
              begin 
                 codigo.Text:= inttostr(prxcod('produto_embalagens', 'codigo', dm.IBTransaction, dm.ibsqlcod));
                 sql.Add('INSERT INTO PRODUTO_EMBALAGENS(CODIGO, DESCRICAO, COD_PRO, QUANT, UNIDADE, ' +
                 ' CODIGO_BARRA, VALOR) ' +
                         'VALUES(:1, :2, :3, :4, :5, :6, :VALOR)');
              end
           else
              begin 
                 sql.Add('UPDATE PRODUTO_EMBALAGENS SET DESCRICAO = :2, COD_PRO = :3, ' +
                         'VALOR=:VALOR, '+
                         'QUANT = :4, UNIDADE = :5, CODIGO_BARRA = :6 WHERE CODIGO = :1');
              end;
           Parambyname('1').AsInteger  := strtoint(codigo.Text);
           Parambyname('2').AsString   := trim(EdtNome.Text);
           Parambyname('3').AsInteger  := strtoint(EdtCodPro.Text);
           Parambyname('4').AsCurrency := strtocurr(EdtQuant.Text);
           Parambyname('5').AsString   := trim(EdtUnidade.Text);
           Parambyname('6').AsString   := trim(EdtCodBarra.Text);
           ParamByName('VALOR').AsCurrency := edtValor.Value;
           ExecOrOpen;
        end;
      IBTREmbalagem.Commit;
      Botoes('G');

    except
      IBTREmbalagem.Rollback;
      AlertaCad('Erro ao Gravar a Embalagem');
    end;
  finally
    IBSQLEmbalagem.Close;
  end;
end;

procedure TFrmCadEmbalagem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if IBTREmbalagem.Active then
     IBTREmbalagem.Commit;
  IBSQLEmbalagem.Close;
  Action:= caFree;
end;

procedure TFrmCadEmbalagem.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C011','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  excluir(FrmCadEmbalagem, 'produto_embalagens', codigo, IBSQLEmbalagem, IBTREmbalagem);
  Botoes('E');
end;

procedure TFrmCadEmbalagem.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsEmbalagens, FrmConsEmbalagens);
  FrmConsEmbalagens.tag:= 0;
  FrmConsEmbalagens.showmodal;
end;

procedure TFrmCadEmbalagem.EdtCodBarraExit(Sender: TObject);
var iAux : integer;
begin 
  inherited;
  if ToolBar1.Focused then
         exit;

  if trim(EdtCodBarra.Text) = '' then
     begin 
//        EdtCodBarra.SetFocus;
     end
  else
     begin 
        {verifica se esta na tabela de produtos}
        iAux:= DM.CodigoBarraProduto(trim(EdtCodBarra.Text));
        if iAux > 0 then
           begin 
              AlertaCad('Codigo de Barras cadastrado no Produto cod.: ' + inttostr(iAux));
//              EdtCodBarra.SetFocus;
              exit;
           end;

        {verifica se esta na tabela de produto_embalagens }
        iAux:= DM.CodigoBarraEmbalagem(trim(EdtCodBarra.Text));
        if iAux > 0 then
           begin 
              if trim(codigo.Text) = '' then
                 begin 
                    AlertaCad('Codigo de Barras cadastrado na Embalagem cod.: ' + inttostr(iAux));
//                    EdtCodBarra.SetFocus;
                 end
              else
                 begin 
                    if strtoint(codigo.Text) <> iAux then
                       begin 
                          AlertaCad('Codigo de Barras cadastrado na Embalagem cod.: ' + inttostr(iAux));
//                          EdtCodBarra.SetFocus;
                       end;
                 end;
           end;

     end;
end;

end.
