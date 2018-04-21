unit UAcesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, DB, pngimage, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, cxPC, sSpeedButton;

type
  TFrmAcesso = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Cod_grupo: UNovosComponentes.TEdit;
    Label7: TLabel;
    BtnConsGrupo: TsSpeedButton;
    EdtNomeGrupo: TEdit;
    Label8: TLabel;
    BtnOK: TBitBtn;
    BtnSair: TBitBtn;
    GB1: TGroupBox;
    CheckIncluir: TCheckBox;
    CheckAlterar: TCheckBox;
    CheckExcluir: TCheckBox;
    BtnGrava: TBitBtn;
    Label30: TLabel;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    BtnExcluir: TBitBtn;
    QFuncoesDisp: TFDQuery;
    IBTRFuncoesDisp: TFDTransaction;
    QFuncoesDispCOD_FUNCAO: TIntegerField;
    QFuncoesDispNOME_FUNCAO: TStringField;
    QFuncoesDispTIPO_MENU: TStringField;
    DSQFuncoesDisp: TDataSource;
    QFuncoesUtil: TFDQuery;
    DSQFuncoesUtil: TDataSource;
    IBTRFuncoesUtil: TFDTransaction;
    QFuncoesUtilCOD_FUNCAO: TIntegerField;
    QFuncoesUtilCOD_GRUPO: TIntegerField;
    QFuncoesUtilINSERIR: TStringField;
    QFuncoesUtilALTERAR: TStringField;
    QFuncoesUtilEXCLUIR: TStringField;
    QFuncoesUtilNOME_FUNCAO: TStringField;
    QBuscaGrupo: TFDQuery;
    QBuscaGrupoCOD_GRUPO: TIntegerField;
    QBuscaGrupoNOME_GRUPO: TStringField;
    QBuscaGrupoSUPER_GRUPO: TStringField;
    QGravaExclui: TFDQuery;
    IBTRGravaExclui: TFDTransaction;
    procedure BtnOKClick(Sender: TObject);
    procedure QFuncoesDispAfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnConsGrupoClick(Sender: TObject);
    procedure Cod_grupoExit(Sender: TObject);
    procedure Cod_grupoKeyPress(Sender: TObject; var Key: Char);
    procedure Cod_grupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 function FrmAcesso: TFrmAcesso;

implementation
uses
  Udm, UConsGrupoUsuario, UNovoPrincipal, UPrincipal;
var vl_super_grupo : string[1];
var iAux : integer;

{$R *.dfm}

function FrmAcesso: TFrmAcesso;
begin
   Result := TFrmAcesso( BuscaFormulario( TFrmAcesso, False ) );
end;

procedure TFrmAcesso.BtnOKClick(Sender: TObject);
begin 
   if Cod_grupo.Text = '' then
      begin 
         AlertaCad('Digite o Código do Grupo');
//         cod_grupo.SetFocus;
         exit;
      end;
   if vl_super_grupo <> 'S' then
      begin 
         if IBTRFuncoesUtil.Active then
            IBTRFuncoesUtil.Commit;
         IBTRFuncoesUtil.StartTransaction;
         with QFuncoesUtil do
            begin 
               Parambyname('codgrupo').value := Cod_grupo.Text;
               open;
               if recordcount > 0 then
                  BtnExcluir.Enabled:= true
               else
                  BtnExcluir.Enabled:= false;
            end;

         if IBTRFuncoesDisp.Active then
            IBTRFuncoesDisp.Commit;
         IBTRFuncoesDisp.StartTransaction;
         try
           with QFuncoesDisp do
              begin 
                 close;
                 Parambyname('codgrupo').Value := Cod_grupo.Text;
                 open;
                 Locate('cod_funcao', iAux, []);
                 if recordcount > 0 then
                    BtnGrava.Enabled:= true
                 else
                    BtnGrava.Enabled:= false;
              end;
         except
           IBTRFuncoesDisp.Rollback;
           AlertaCad('Erro ao Buscar as Funções Disponíveis');
         end;
      end
   else
      begin 
         AlertaCad('Este Grupo de Usuário é Super Grupo, tem acesso total ao sistema');
//         Cod_grupo.SetFocus;
         Cod_grupo.SelectAll;
      end;
end;

procedure TFrmAcesso.QFuncoesDispAfterScroll(DataSet: TDataSet);
begin 
     CheckIncluir.Checked := true;
     CheckAlterar.Checked := true;
     CheckExcluir.Checked := true;
     if trim(QFuncoesDispTIPO_MENU.Value) = 'S' then
        gb1.Enabled:= true
     else
        gb1.Enabled:= false;
end;

procedure TFrmAcesso.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
   if IBTRFuncoesDisp.Active then
      IBTRFuncoesDisp.Commit;
   QFuncoesDisp.Close;
   if IBTRFuncoesUtil.Active then
      IBTRFuncoesUtil.Commit;
   QFuncoesUtil.Close;
   Action:= caFree;
end;

procedure TFrmAcesso.BtnConsGrupoClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsGrupoUsuario, FrmConsGrupoUsuario);
   FrmConsGrupoUsuario.tag:= 2;
   FrmConsGrupoUsuario.ShowModal;
end;

procedure TFrmAcesso.Cod_grupoExit(Sender: TObject);
begin
   if BtnSair.Focused then
     exit;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with QBuscaGrupo do
          begin
             close;
             Parambyname('codgrupo').AsInteger  := StrToInt( Cod_grupo.Text );
             Open;
             if recordcount > 0 then
                begin
                   EdtNomeGrupo.Text:= QBuscaGrupoNOME_GRUPO.Value;
                   vl_super_grupo:= trim(QBuscaGrupoSUPER_GRUPO.Value);
                   BtnOK.SetFocus;
                end
             else
                begin
                   AlertaCad('Grupo de Usuário não Cadastrado');
                   EdtNomeGrupo.Clear;
                   Cod_grupo.SelectAll;
//                   Cod_grupo.SetFocus;
                end;
          end;
     Except
        AlertaCad( 'Erro ao localizar Grupo de Usuários!' );
     end;
   finally
       dm.IBTransaction.Commit;
       QBuscaGrupo.Close;
   end;
end;

procedure TFrmAcesso.Cod_grupoKeyPress(Sender: TObject; var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0; 
end;

procedure TFrmAcesso.Cod_grupoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsGrupo.Click;
end;

procedure TFrmAcesso.FormShow(Sender: TObject);
begin 
   iAux:= 0;
   Cod_grupo.Clear;
   EdtNomeGrupo.Clear;
   Cod_grupo.SetFocus;
   btngrava.Enabled   := false;
   BtnExcluir.Enabled := false;
end;

procedure TFrmAcesso.BtnGravaClick(Sender: TObject);
begin 
   if IBTRGravaExclui.Active then
      IBTRGravaExclui.Commit;
   IBTRGravaExclui.StartTransaction;
   try
     try
       with QGravaExclui do
          begin 
             close;
             sql.Clear;
             sql.Text:= 'INSERT INTO FUNCOES_GRUPO_USUARIO (COD_FUNCAO, COD_GRUPO, INSERIR, ALTERAR, EXCLUIR) ' +
                        'VALUES(:CODFUNCAO, :CODGRUPO, :INS, :ALT, :EXC)';
             Parambyname('codfuncao').AsInteger := QFuncoesDispCOD_FUNCAO.Value;
             Parambyname('codgrupo').AsInteger  := StrToInt(cod_grupo.Text);
             if CheckIncluir.Checked then
                Parambyname('ins').AsString     := 'S'
             else
                Parambyname('ins').AsString     := 'N';
             if CheckAlterar.Checked then
                Parambyname('alt').AsString     := 'S'
             else
                Parambyname('alt').AsString     := 'N';
             if CheckExcluir.Checked then
                Parambyname('exc').AsString     := 'S'
             else
                Parambyname('exc').AsString     := 'N';
             ExecOrOpen;
          end;
       IBTRGravaExclui.Commit;
       QFuncoesDisp.Next;
       iAux:= QFuncoesDispCOD_FUNCAO.AsInteger;
       QFuncoesDisp.Prior;
       QFuncoesUtil.Refresh;
     except
       IBTRGravaExclui.Rollback;
       AlertaCad('Erro ao Gravar a Função');
     end;
   finally
     QGravaExclui.close;
     btnok.Click;
   end;
end;

procedure TFrmAcesso.BtnExcluirClick(Sender: TObject);
begin 
   if IBTRGravaExclui.Active then
      IBTRGravaExclui.Commit;
   IBTRGravaExclui.StartTransaction;
   try
     try
       with QGravaExclui do
          begin 
             close;
             sql.Clear;
             sql.Text:= 'DELETE FROM FUNCOES_GRUPO_USUARIO ' +
                        'WHERE COD_FUNCAO = :CODFUNCAO AND COD_GRUPO = :CODGRUPO';
             Parambyname('codfuncao').AsInteger := QFuncoesUtilCOD_FUNCAO.Value;
             Parambyname('codgrupo').AsInteger  := QFuncoesUtilCOD_GRUPO.Value;
             ExecOrOpen;
          end;
       IBTRGravaExclui.Commit;
       QFuncoesUtil.Refresh;
     except
       IBTRGravaExclui.Rollback;
       AlertaCad('Erro ao Excluir a Função');
     end;
   finally
     QGravaExclui.Close;
     BtnOK.Click;
   end;
end;

procedure TFrmAcesso.BtnSairClick(Sender: TObject);
begin 
   if Parent is TcxTabSheet then
      frmMenu.FTDI.CloseTabOfForm( TFormClass( Self.ClassType ) )
   else
      close;
end;

procedure TFrmAcesso.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmAcesso.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

end.
