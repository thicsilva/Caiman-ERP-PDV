unit UCadSetorEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, ImgList, ComCtrls, ToolWin, ExtCtrls, Buttons, StdCtrls, 
  UNovosComponentes, UNovoFormulario, cxGraphics, cxControls, cxLookAndFeels, 
  cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, 
  dxSkinsdxStatusBarPainter, acAlphaImageList, dxStatusBar, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, sSpeedButton, dxSkinMetropolisDark,
  Data.DB;

type
  TFrmCadSetorEstoque = class(TFrmCadastroNovo)
    Label1: TLabel;
    codigo: UNovosComponentes.TEdit;
    Label2: TLabel;
    EdtNome: TEdit;
    Label32: TLabel;
    EdtCodUsu: UNovosComponentes.TEdit;
    BtnConsUsu: TsSpeedButton;
    EdtNomeUsu: TEdit;
    Label33: TLabel;
    IBSQLSE: TFDQuery;
    IBTRSE: TFDTransaction;
    EdtDataInicioEstoque: TDateTimePicker;
    Label3: TLabel;
    procedure EdtCodUsuEnter(Sender: TObject);
    procedure EdtCodUsuExit(Sender: TObject);
    procedure EdtCodUsuKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodUsuKeyPress(Sender: TObject; var Key: Char);
    procedure BtnConsUsuClick(Sender: TObject);
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

 function FrmCadSetorEstoque: TFrmCadSetorEstoque;

implementation

uses
  UDM, Ubibli1, UConsUsu, UConsSetorEstoque, UNovoPrincipal;
var  bGrava : boolean;

{$R *.dfm}

function FrmCadSetorEstoque: TFrmCadSetorEstoque;
begin
   Result := TFrmCadSetorEstoque( BuscaFormulario( TFrmCadSetorEstoque, False ) );
end;

procedure TFrmCadSetorEstoque.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          EDedit(FrmCadSetorEstoque, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmCadSetorEstoque);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmCadSetorEstoque);
         EDedit(FrmCadSetorEstoque, false);
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

procedure TFrmCadSetorEstoque.EdtCodUsuEnter(Sender: TObject);
begin 
  inherited;
  EdtCodUsu.SelectAll;
end;

procedure TFrmCadSetorEstoque.EdtCodUsuExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;
  EdtNomeUsu.Text:= dm.RetornaStringTabela('nome_usu', 'usuario', 'cod_usu', strtoint(EdtCodUsu.Text));
  if trim(EdtNomeUsu.Text) = '' then
     begin 
        AlertaCad('Usuário não cadastrado');
//        EdtCodUsu.SetFocus;
     end;
end;

procedure TFrmCadSetorEstoque.EdtCodUsuKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     BtnConsUsu.Click;
end;

procedure TFrmCadSetorEstoque.EdtCodUsuKeyPress(Sender: TObject;
  var Key: Char);
begin 
  inherited;
  if not (key in ['0'..'9', #13, #8]) then
     key:= #0;
end;

procedure TFrmCadSetorEstoque.BtnConsUsuClick(Sender: TObject);
begin 
  inherited;
  application.CreateForm(TFrmConsUsu, FrmConsUsu);
  FrmConsUsu.Tag:= 1;
  FrmConsUsu.ShowModal;
end;

procedure TFrmCadSetorEstoque.FormShow(Sender: TObject);
begin 
  inherited;
  if tag = 0 then
     begin 
        bGrava:= true;
        if not DM.Acesso('C036','I') then
           begin 
             Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
             Botoes('C');
           end
        else
           begin 
             Botoes('N');
             EdtDataInicioEstoque.Date:= date;
             edtnome.SetFocus;
           end;
     end
  else
     if tag = 1 then
        Botoes('G');
end;

procedure TFrmCadSetorEstoque.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  bGrava:= true;
  if not DM.Acesso('C036','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  EdtDataInicioEstoque.Date:= date;
  edtnome.SetFocus;
end;

procedure TFrmCadSetorEstoque.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  Botoes('C');
end;

procedure TFrmCadSetorEstoque.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C036','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  bGrava:= false;
  Botoes('A');
  edtnome.SetFocus;
end;

procedure TFrmCadSetorEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
   if IBTRSE.Active then
     IBTRSE.Commit;
  IBSQLSE.Close;
  Action:= caFree; 
end;

procedure TFrmCadSetorEstoque.BtnGravarClick(Sender: TObject);
begin 
  inherited;
   if (bGrava) and (not DM.Acesso('C036','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;

  if trim(edtnome.Text) = '' then
     begin 
        AlertaCad('Digite o Nome da Classificação');
//        edtnome.SetFocus;
        exit;
     end;

  if trim(EdtCodUsu.Text) = '' then
     begin 
        AlertaCad('Informe o código do usuário');
//        EdtCodUsu.SetFocus;
        exit;
     end;

  if IBTRSE.Active then
     IBTRSE.Commit;
  IBTRSE.StartTransaction;
  try
    try
      with IBSQLSE do
        begin 
           close;
           sql.Clear;
           if bGrava then
              begin 
                 codigo.Text:= inttostr(prxcod('setores_estoque', 'codigo', dm.IBTransaction, dm.ibsqlcod));
                 sql.Add('INSERT INTO SETORES_ESTOQUE(CODIGO, DESCRICAO, COD_USU, DATA_INICIO_ESTOQUE) ' +
                         'VALUES(:1, :2, :3, :4)');
              end
           else
              begin 
                 sql.Add('UPDATE SETORES_ESTOQUE SET DESCRICAO = :2, COD_USU = :3, ' +
                         ' DATA_INICIO_ESTOQUE = :4 WHERE CODIGO = :1');
              end;
           Parambyname('1').AsInteger := strtoint(codigo.Text);
           Parambyname('2').AsString  := trim(edtnome.Text);
           Parambyname('3').AsInteger := strtoint(EdtCodUsu.Text);
           Parambyname('4').AsDate    := EdtDataInicioEstoque.date;
           ExecOrOpen;
        end;
      IBTRSE.Commit;
      Botoes('G');
    except
      IBTRSE.Rollback;
      AlertaCad('Erro ao Gravar o Setor do Estoque');
    end;
  finally
    IBSQLSE.Close;
  end;
end;

procedure TFrmCadSetorEstoque.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C036','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  excluir(FrmCadSetorEstoque, 'setores_estoque', codigo, IBSQLSE, IBTRSE);
  Botoes('E');
end;

procedure TFrmCadSetorEstoque.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsSetorEstoque, FrmConsSetorEstoque);
  FrmConsSetorEstoque.tag:= 0;
  FrmConsSetorEstoque.showmodal;
end;

end.
