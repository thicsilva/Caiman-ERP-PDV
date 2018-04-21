unit UCadMarcas;

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
  TFrmCadMarcas = class(TFrmCadastroNovo)
    Label1: TLabel;
    codigo: UNovosComponentes.TEdit;
    Label2: TLabel;
    EdtNome: TEdit;
    IBSQLMarca: TFDQuery;
    IBTRMarca: TFDTransaction;
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

  function FrmCadMarcas: TFrmCadMarcas;

implementation
uses
  Udm, Ubibli1, UConsMarcas, UNovoPrincipal;
var  bGrava : boolean;

{$R *.dfm}

function FrmCadMarcas: TFrmCadMarcas;
begin
   Result := TFrmCadMarcas(  BuscaFormulario( TFrmCadMarcas, False ) );
end;

procedure TFrmCadMarcas.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          EDedit(FrmCadMarcas, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmCadMarcas);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmCadMarcas);
         EDedit(FrmCadMarcas, false);
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

procedure TFrmCadMarcas.FormShow(Sender: TObject);
begin 
  inherited;
  if tag = 0 then
     begin 
        bGrava:= true;
        if not DM.Acesso('C028','I') then
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

procedure TFrmCadMarcas.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  bGrava:= true;
  if not DM.Acesso('C028','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  edtnome.SetFocus;
end;

procedure TFrmCadMarcas.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  Botoes('C');
end;

procedure TFrmCadMarcas.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C028','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  bGrava:= false;
  Botoes('A');
  edtnome.SetFocus;
end;

procedure TFrmCadMarcas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if IBTRMarca.Active then
     IBTRMarca.Commit;
  IBSQLMarca.Close;
  Action:= caFree;
end;

procedure TFrmCadMarcas.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if (bGrava) and (not DM.Acesso('C028','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  if edtnome.Text = '' then
     begin 
        AlertaCad('Digite o Nome da Marca');
//        edtnome.SetFocus;
        exit;
     end;
  if IBTRMarca.Active then
     IBTRMarca.Commit;
  IBTRMarca.StartTransaction;
  try
    try
      with IBSQLMarca do
        begin 
           close;
           sql.Clear;
           if bGrava then
              begin 
                 codigo.Text:= inttostr(prxcod('marcas', 'codigo', dm.IBTransaction, dm.ibsqlcod));
                 sql.Add('INSERT INTO MARCAS(CODIGO, DESCRICAO) VALUES(:COD, :DESC)');
              end
           else
              begin 
                 sql.Add('UPDATE MARCAS SET DESCRICAO = :DESC WHERE CODIGO = :COD');
              end;
           Parambyname('cod').AsInteger := strtoint(codigo.Text);
           Parambyname('desc').AsString := edtnome.Text;
           ExecOrOpen;
        end;
      IBTRMarca.Commit;
      Botoes('G');
    except
      IBTRMarca.Rollback;
      AlertaCad('Erro ao Gravar a Marca');
    end;
  finally
    IBSQLMarca.Close;
  end;
end;

procedure TFrmCadMarcas.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C028','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  excluir(FrmCadMarcas, 'marcas', codigo, IBSQLMarca, IBTRMarca);
  Botoes('E');
end;

procedure TFrmCadMarcas.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsMarcas, FrmConsMarcas);
  FrmConsMarcas.tag:= 0;
  FrmConsMarcas.showmodal;
end;

end.
