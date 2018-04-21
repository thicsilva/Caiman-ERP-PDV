unit UCadTipoDoc;

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
  TFrmCadTipoDoc = class(TFrmCadastroNovo)
    Label1: TLabel;
    cod_doc: UNovosComponentes.TEdit;
    Label2: TLabel;
    EdtNome: TEdit;
    IBSQLDoc: TFDQuery;
    IBTRDoc: TFDTransaction;
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

 function FrmCadTipoDoc: TFrmCadTipoDoc;

implementation
uses
  Udm, Ubibli1, UConsTipoDoc, UNovoPrincipal;
var vl_grava : boolean;

{$R *.dfm}

function FrmCadTipoDoc: TFrmCadTipoDoc;
begin
   Result := TFrmCadTipoDoc( BuscaFormulario( TFrmCadTipoDoc, False ) );
end;

procedure TFrmCadTipoDoc.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          EDedit(FrmCadTipoDoc, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmCadTipoDoc);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmCadTipoDoc);
         EDedit(FrmCadTipoDoc, false);
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

procedure TFrmCadTipoDoc.FormShow(Sender: TObject);
begin 
  inherited;
  if tag = 0 then
     begin 
        vl_grava:= true;
        if not DM.Acesso('C022','I') then
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

procedure TFrmCadTipoDoc.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  vl_grava:= true;
  if not DM.Acesso('C022','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  edtnome.SetFocus;
end;

procedure TFrmCadTipoDoc.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  Botoes('C');
end;

procedure TFrmCadTipoDoc.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C022','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  vl_grava:= false;
  Botoes('A');
  edtnome.SetFocus;
end;

procedure TFrmCadTipoDoc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if IBTRDoc.Active then
     IBTRDoc.Commit;
  IBSQLDoc.Close;
  Action:= caFree;
end;

procedure TFrmCadTipoDoc.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if (vl_grava) and (not DM.Acesso('C022','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  if edtnome.Text = '' then
     begin 
        AlertaCad('Digite o Nome do Tipo de Documento');
//        edtnome.SetFocus;
        exit;
     end;
  if IBTRDoc.Active then
     IBTRDoc.Commit;
  IBTRDoc.StartTransaction;
  try
    try
      with IBSQLDoc do
        begin 
           close;
           sql.Clear;
           if vl_grava = true then
              begin 
                 cod_doc.Text:= inttostr(prxcod('tipo_documento', 'cod_doc', dm.IBTransaction, dm.ibsqlcod));
                 sql.Add('INSERT INTO TIPO_DOCUMENTO(COD_DOC, NOME_DOC) VALUES(:CODDOC, :NOMEDOC)');
              end
           else
              begin 
                 sql.Add('UPDATE TIPO_DOCUMENTO SET NOME_DOC = :NOMEDOC WHERE COD_DOC = :CODDOC');
              end;
           Parambyname('coddoc').AsInteger     := strtoint(cod_doc.Text);
           Parambyname('nomedoc').AsString     := edtnome.Text;
           ExecOrOpen;
        end;
      IBTRDoc.Commit;
      Botoes('G');
    except
      IBTRDoc.Rollback;
      AlertaCad('Erro ao Gravar o Tipo de Documento');
    end;
  finally
    IBSQLDoc.Close;
  end;
end;

procedure TFrmCadTipoDoc.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C022','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  excluir(FrmCadTipoDoc, 'tipo_documento', cod_doc, IBSQLDoc, IBTRDoc);
  Botoes('E');
end;

procedure TFrmCadTipoDoc.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsTipoDoc, FrmConsTipoDoc);
  FrmConsTipoDoc.tag:= 0;
  FrmConsTipoDoc.showmodal;
end;

end.
