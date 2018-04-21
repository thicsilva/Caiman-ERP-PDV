unit UCadMotivo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, Buttons, ExtCtrls, ComCtrls, StdCtrls, ImgList, ToolWin, 
  UNovosComponentes, UNovoFormulario, cxGraphics, cxControls, cxLookAndFeels, 
  cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, dxSkinMetropolisDark, 
  dxSkinsdxStatusBarPainter, acAlphaImageList, dxStatusBar, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, Data.DB;

type
  TFrmCadMotivo = class(TFrmCadastroNovo)
    Label1: TLabel;
    cod_mot: UNovosComponentes.TEdit;
    Label2: TLabel;
    EdtNome: TEdit;
    Label3: TLabel;
    ComboMotivo: TComboBox;
    IBSQLMot: TFDQuery;
    IBTRMot: TFDTransaction;
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure Botoes(acao : string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 function FrmCadMotivo: TFrmCadMotivo;

implementation
uses
  Udm, Ubibli1, UConsMotivo, UNovoPrincipal;
var vl_grava : boolean;

{$R *.dfm}

function FrmCadMotivo: TFrmCadMotivo;
begin
   Result := TFrmCadMotivo( BuscaFormulario( TFrmCadMotivo, False ) );
end;

procedure TFrmCadMotivo.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          EDedit(FrmCadMotivo, true);
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmCadMotivo);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmCadMotivo);
         EDedit(FrmCadMotivo, false);
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

procedure TFrmCadMotivo.FormShow(Sender: TObject);
begin 
  inherited;
  if tag = 0 then
     begin 
        vl_grava:= true;
        if not DM.Acesso('C012','I') then
           begin 
             Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
             Botoes('C');
           end
        else
           begin 
             Botoes('N');
             combomotivo.ItemIndex:= 1;
             edtnome.SetFocus;
           end;
     end
  else
     if tag = 1 then
        Botoes('G');
end;

procedure TFrmCadMotivo.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  vl_grava:= true;
  if not DM.Acesso('C012','I') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  Botoes('N');
  combomotivo.ItemIndex:= 1;
  edtnome.SetFocus;
end;

procedure TFrmCadMotivo.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  Botoes('C');
end;

procedure TFrmCadMotivo.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C012','A') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  vl_grava:= false;
  Botoes('A');
  edtnome.SetFocus;
end;

procedure TFrmCadMotivo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if IBTRMot.Active then
     IBTRMot.Commit;
  IBSQLMot.Close;
  Action:= caFree;
end;

procedure TFrmCadMotivo.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if (vl_grava) and (not DM.Acesso('C012','I')) then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  if edtnome.Text = '' then
     begin 
        AlertaCad('Digite o Nome do Motivo');
//        edtnome.SetFocus;
        exit;
     end;
  if IBTRMot.Active then
     IBTRMot.Commit;
  IBTRMot.StartTransaction;
  try
    try
      with IBSQLMot do
        begin 
           close;
           sql.Clear;
           if vl_grava = true then
              begin 
                 cod_mot.Text:= IntToStr(Prxcod('motivo_acerto', 'cod_mot', dm.IBTransaction, dm.IBSQLCod));
                 sql.Add('INSERT INTO MOTIVO_ACERTO(COD_MOT, NOME_MOT, ENTSAI_MOT) VALUES(:CODMOT, :NOMEMOT, :ENTSAIMOT)');
              end
           else
              begin 
                 sql.Add('UPDATE MOTIVO_ACERTO SET NOME_MOT = :NOMEMOT, ENTSAI_MOT = :ENTSAIMOT WHERE COD_MOT = :CODMOT');
              end;
           Parambyname('codmot').AsInteger     := strtoint(cod_mot.Text);
           Parambyname('nomemot').AsString     := edtnome.Text;
           Parambyname('entsaimot').AsString   := copy(combomotivo.Text, 1, 1);
           ExecOrOpen;
        end;
      IBTRMot.Commit;
      Botoes('G');
    except
      IBTRMot.Rollback;
      AlertaCad('Erro ao Gravar o Motivo');
    end;
  finally
    IBSQLMot.Close;
  end;
end;

procedure TFrmCadMotivo.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  if not DM.Acesso('C012','E') then
     begin 
        Application.MessageBox('Você não tem permissão para efetuar esta operação.', 'Aviso', mb_ApplModal + mb_iconInformation + mb_OK + mb_DefButton1);
        Abort;
        Exit;
     end;
  excluir(FrmCadMotivo, 'motivo_acerto', cod_mot, IBSQLMot, IBTRMot);
  Botoes('E');
end;

procedure TFrmCadMotivo.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsMotivo, FrmConsMotivo);
  FrmConsMotivo.tag:= 0;
  FrmConsMotivo.showmodal;
end;

end.
