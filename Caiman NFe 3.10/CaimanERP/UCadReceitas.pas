unit UCadReceitas;

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
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, Data.DB;

type
  TFrmCadReceitas = class(TFrmCadastroNovo)
    Label1: TLabel;
    cod_receita: UNovosComponentes.TEdit;
    Label30: TLabel;
    MemoIngredientes: TMemo;
    IBSQLRec: TFDQuery;
    IBTRRec: TFDTransaction;
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

  function FrmCadReceitas: TFrmCadReceitas;

implementation
uses
  Udm, Ubibli1, UConsReceitas, UNovoPrincipal;
var  sGrava : boolean;

{$R *.dfm}

function FrmCadReceitas: TFrmCadReceitas;
begin
   Result := TFrmCadReceitas( BuscaFormulario( TFrmCadReceitas, False ) );
end;

procedure TFrmCadReceitas.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          EDedit(FrmCadReceitas, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmCadReceitas);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmCadReceitas);
         EDedit(FrmCadReceitas, false);
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

procedure TFrmCadReceitas.FormShow(Sender: TObject);
begin 
  inherited;
  if tag = 0 then
     begin 
        sGrava:= true;
        if not DM.Acesso('C034','I') then
           begin 
             Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
             Botoes('C');
           end
        else
           begin 
             Botoes('N');
             MemoIngredientes.SetFocus;
           end;
     end
  else
     if tag = 1 then
        Botoes('G');
end;

procedure TFrmCadReceitas.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  sGrava:= true;
  if not DM.Acesso('C034','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  MemoIngredientes.SetFocus;
end;

procedure TFrmCadReceitas.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  Botoes('C');
end;

procedure TFrmCadReceitas.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C034','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  sGrava:= false;
  Botoes('A');
  MemoIngredientes.SetFocus;
end;

procedure TFrmCadReceitas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if IBTRRec.Active then
     IBTRRec.Commit;
  IBSQLRec.Close;
  Action:= caFree;
end;

procedure TFrmCadReceitas.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if (sGrava) and (not DM.Acesso('C034','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  if trim(MemoIngredientes.Text) = '' then
     begin 
        AlertaCad('Digite a Receita');
//        MemoIngredientes.SetFocus;
        exit;
     end;
  if IBTRRec.Active then
     IBTRRec.Commit;
  IBTRRec.StartTransaction;
  try
    try
      with IBSQLRec do
        begin 
           close;
           sql.Clear;
           if sGrava = true then
              begin 
                 cod_receita.Text:= inttostr(prxcod('receitas', 'cod_receita', dm.IBTransaction, dm.ibsqlcod));
                 sql.Add('INSERT INTO RECEITAS(COD_RECEITA, INGREDIENTES) ' +
                         'VALUES(:COD, :ING)');
              end
           else
              begin 
                 sql.Add('UPDATE RECEITAS ' +
                         'SET INGREDIENTES = :ING ' +
                         'WHERE COD_RECEITA = :COD');
              end;
           Parambyname('cod').AsInteger := strtoint(cod_receita.Text);
           Parambyname('ing').AsString  := MemoIngredientes.Text;
           ExecOrOpen;
        end;
      IBTRRec.Commit;
      Botoes('G');
    except
      IBTRRec.Rollback;
      AlertaCad('Erro ao Gravar a Receita');
    end;
  finally
    IBSQLRec.Close;
  end;
end;

procedure TFrmCadReceitas.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C034','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  excluir(FrmCadReceitas, 'receitas', cod_receita, IBSQLRec, IBTRRec);
  Botoes('E');
end;

procedure TFrmCadReceitas.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsReceitas, FrmConsReceitas);
  FrmConsReceitas.tag:= 0;
  FrmConsReceitas.showmodal;
end;

end.
