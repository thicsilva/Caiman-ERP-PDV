unit UCadTipoProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, ImgList, ComCtrls, ToolWin, ExtCtrls, StdCtrls, 
  UNovosComponentes, UNovoFormulario, cxGraphics, cxControls, cxLookAndFeels, 
  cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, dxSkinMetropolisDark, 
  dxSkinsdxStatusBarPainter, acAlphaImageList, dxStatusBar, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, Data.DB, System.ImageList;

type
  TFrmCadTipoProduto = class(TFrmCadastroNovo)
    Label1: TLabel;
    codigo: UNovosComponentes.TEdit;
    Label2: TLabel;
    EdtNome: TEdit;
    IBSQLTipo: TFDQuery;
    IBTRTipo: TFDTransaction;
    CheckServico: TCheckBox;
    Label3: TLabel;
    edtCodEFD: TEdit;
    procedure Botoes(acao : string);
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function FrmCadTipoProduto: TFrmCadTipoProduto;

implementation
uses
  Udm, Ubibli1, UConsTipoProduto, UNovoPrincipal;
var  bGrava : boolean;

{$R *.dfm}

function FrmCadTipoProduto: TFrmCadTipoProduto;
begin
   Result := TFrmCadTipoProduto( BuscaFormulario( TFrmCadTipoProduto, False ) );
end;

procedure TFrmCadTipoProduto.Botoes(acao : string);
begin
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          EDedit(FrmCadTipoProduto, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmCadTipoProduto);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmCadTipoProduto);
         EDedit(FrmCadTipoProduto, false);
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

procedure TFrmCadTipoProduto.FormShow(Sender: TObject);
begin 
  inherited;
  if tag = 0 then
     begin 
        bGrava:= true;
        if not DM.Acesso('C035','I') then
           begin 
             Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
             Botoes('C');
           end
        else
           begin 
             Botoes('N');
             edtnome.SetFocus;
           end;
     end
  else
     if tag = 1 then
        Botoes('G');
end;

procedure TFrmCadTipoProduto.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  bGrava:= true;
  if not DM.Acesso('C035','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  edtnome.SetFocus;
end;

procedure TFrmCadTipoProduto.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  Botoes('C');
end;

procedure TFrmCadTipoProduto.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C035','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  bGrava:= false;
  Botoes('A');
  edtnome.SetFocus;
end;

procedure TFrmCadTipoProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if IBTRTipo.Active then
     IBTRTipo.Commit;
  IBSQLTipo.Close;
  Action:= caFree;
end;

procedure TFrmCadTipoProduto.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if (bGrava) and (not DM.Acesso('C035','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  if edtnome.Text = '' then
     begin 
        AlertaCad('Digite a Descrição');
//        edtnome.SetFocus;
        exit;
     end;
  if IBTRTipo.Active then
     IBTRTipo.Commit;
  IBTRTipo.StartTransaction;
  try
    try
      with IBSQLTipo do
        begin 
           close;
           sql.Clear;
           if bGrava then
              begin 
                 codigo.Text:= inttostr(prxcod('tipo_produto', 'codigo', dm.IBTransaction, dm.ibsqlcod));
                 sql.Add('INSERT INTO TIPO_PRODUTO(CODIGO, DESCRICAO, SERVICO, EFD_TIPO) ' +
                         'VALUES(:1, :2, :3, :EFD_TIPO)');
              end
           else
              begin 
                 sql.Add('UPDATE TIPO_PRODUTO SET DESCRICAO = :2, SERVICO = :3, EFD_TIPO=:EFD_TIPO ' +
                         'WHERE CODIGO = :1');
              end;
           Parambyname('1').AsInteger := strtoint(codigo.Text);
           Parambyname('2').AsString  := edtnome.Text;
           ParamByName( 'EFD_TIPO' ).AsString := edtCodEFD.Text;
           if CheckServico.Checked then
              Parambyname('3').AsString  := 'S'
           else
              Parambyname('3').AsString  := 'N';

           ExecOrOpen;
        end;
      IBTRTipo.Commit;
      Botoes('G');
    except
      IBTRTipo.Rollback;
      AlertaCad('Erro ao Gravar');
    end;
  finally
    IBSQLTipo.Close;
  end;
end;

procedure TFrmCadTipoProduto.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C035','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  excluir(FrmCadTipoProduto, 'TIPO_PRODUTO', codigo, IBSQLTipo, IBTRTipo);
  Botoes('E');
end;

procedure TFrmCadTipoProduto.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsTipoProduto, FrmConsTipoProduto);
  FrmConsTipoProduto.tag:= 0;
  FrmConsTipoProduto.showmodal;
end;

end.
