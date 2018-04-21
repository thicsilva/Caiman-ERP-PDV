unit UCadUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, ImgList, ComCtrls, ToolWin, ExtCtrls, Buttons, Grids, 
  DBGrids, StdCtrls, DB, UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet, cxGraphics, cxControls, 
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, 
  dxSkinMetropolisDark, dxSkinsdxStatusBarPainter, acAlphaImageList, 
  dxStatusBar, sSpeedButton;

type
  TFrmCadUsu = class(TFrmCadastroNovo)
    Panel3: TPanel;
    Panel4: TPanel;
    cod_usu: UNovosComponentes.TEdit;
    Label1: TLabel;
    Label2: TLabel;
    EdtNome: TEdit;
    Label3: TLabel;
    EdtSenha: TEdit;
    DBGrid1: TDBGrid;
    Label4: TLabel;
    Label5: TLabel;
    cod_emp: UNovosComponentes.TEdit;
    BtnConsEmp: TsSpeedButton;
    EdtNomeEmp: TEdit;
    Label6: TLabel;
    BtnGrava: TBitBtn;
    BtnExclui: TBitBtn;
    IBSQLUsu: TFDQuery;
    IBTRUsu: TFDTransaction;
    IBSQLUsuEmp: TFDQuery;
    QBuscaItens: TFDQuery;
    DSQBuscaItens: TDataSource;
    QBuscaItensCOD_USU: TIntegerField;
    QBuscaItensCOD_EMP: TIntegerField;
    QBuscaItensRAZAO_EMP: TStringField;
    Cod_grupo: UNovosComponentes.TEdit;
    Label7: TLabel;
    BtnConsGrupo: TsSpeedButton;
    EdtNomeGrupo: TEdit;
    Label8: TLabel;
    CheckOperador: TCheckBox;
    procedure cod_empExit(Sender: TObject);
    procedure BtnConsEmpClick(Sender: TObject);
    procedure cod_empKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cod_empKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnGravaClick(Sender: TObject);
    procedure BtnExcluiClick(Sender: TObject);
    procedure BuscaItem;
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnConsultarClick(Sender: TObject);
    procedure BtnConsGrupoClick(Sender: TObject);
    procedure Cod_grupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Cod_grupoExit(Sender: TObject);
    procedure Botoes(acao : string);
    procedure cod_empEnter(Sender: TObject);
    procedure Cod_grupoEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 function FrmCadUsu: TFrmCadUsu;

implementation
uses
  Udm, Ubibli1, UConsEmp, UConsUsu, UConsGrupoUsuario, UNovoPrincipal;
var bGrava : boolean;

{$R *.dfm}

function FrmCadUsu: TFrmCadUsu;
begin
   Result := TFrmCadUsu( BuscaFormulario( TFrmCadUsu, False ) );
end;

procedure TFrmCadUsu.Botoes(acao : string);
begin 
   {  (N)OVO
      (G)RAVAR
      (C)ANCELAR
      (A)LTERAR
      (E)EXCLUIR
      (P)ESQUISAR/CONSULTAR  }

   if (acao = 'N') or (acao = 'A') then
      begin 
          btnNovo.Enabled      := false;
          BtnGravar.Enabled    := true;
          btnCancelar.Enabled  := true;
          BtnAlterar.Enabled   := false;
          if acao = 'N' then
             begin 
                Limpaedit(FrmCadUsu);
                btnExcluir.Enabled   := false
             end
          else
              btnExcluir.Enabled   := true;
          BtnConsultar.Enabled := false;
      end
   else
      begin 
         if not (acao = 'G') then
            Limpaedit(FrmCadUsu);
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

procedure TFrmCadUsu.BuscaItem;
begin 
   if IBTRUsu.Active then
      IBTRUsu.Commit;
   IBTRUsu.StartTransaction;
   with QBuscaItens do
     begin 
        close;
        Parambyname('codusu').Value:= cod_usu.Text;
        Open;
     end;
   IBTRUsu.CommitRetaining;
end;

procedure TFrmCadUsu.cod_empExit(Sender: TObject);
begin 
  inherited;
  if cod_emp.Text = '' then
     exit;
  EdtNomeEmp.Text:= consulta('empresa', cod_emp, 'cod_emp', 'razao_emp', dm.IBTransaction, dm.qConsulta);
  if EdtNomeEmp.Text = '' then
     begin 
        AlertaCad('Empresa não Cadastrada');
//        cod_emp.SetFocus;
     end;
end;

procedure TFrmCadUsu.BtnConsEmpClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsEmp, FrmConsEmp);
  FrmConsemp.Tag:= 2;
  FrmConsemp.ShowModal;
end;

procedure TFrmCadUsu.cod_empKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     BtnConsEmp.Click; 
end;

procedure TFrmCadUsu.cod_empKeyPress(Sender: TObject; var Key: Char);
begin 
  inherited;
  if not (key in ['0'..'9', #13, #8]) then
     key:= #0; 
end;

procedure TFrmCadUsu.FormShow(Sender: TObject);
begin 
  inherited;
  if tag = 0 then
     begin 
        bGrava:= true;
        Botoes('N');
        panel3.Enabled:= true;
        panel4.Enabled:= false;
        edtnome.SetFocus;
     end
  else
     if tag = 1 then
        Botoes('G');
end;

procedure TFrmCadUsu.BtnCancelarClick(Sender: TObject);
begin 
  inherited;
  if IBTRUsu.Active then
     IBTRUsu.Commit;
  QBuscaItens.Close;
  Botoes('C');
  panel3.Enabled:= false;
  panel4.Enabled:= false;
end;

procedure TFrmCadUsu.BtnAlterarClick(Sender: TObject);
begin 
  inherited;
  bGrava:= false;
  Botoes('A');
  panel3.Enabled:= true;
  panel4.Enabled:= false;
  edtnome.SetFocus;
end;

procedure TFrmCadUsu.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
  inherited;
  if IBTRUsu.Active then
     IBTRUsu.Commit;
  IBSQLUsu.Close;
  QBuscaItens.Close;
  Action:= caFree;
end;

procedure TFrmCadUsu.BtnGravarClick(Sender: TObject);
begin 
  inherited;
  if edtnome.Text = '' then
     begin 
        AlertaCad('Digite o Nome do Usuário');
//        edtnome.SetFocus;
        exit;
     end;
  if IBTRUsu.Active then
     IBTRUsu.Commit;
  IBTRUsu.StartTransaction;
  try
    try
      with IBSQLUsu do
        begin 
           close;
           sql.Clear;
           if bGrava then
              begin 
                 cod_usu.Text:= inttostr(prxcod('usuario', 'cod_usu', dm.IBTransaction, dm.ibsqlcod));
                 sql.Add('INSERT INTO USUARIO(COD_USU, NOME_USU, SENHA_USU, COD_GRUPO, OPERADOR_CAIXA) ' +
                         'VALUES(:CODUSU, :NOMEUSU, :SENHAUSU, :CODGRUPO, :OPERADOR)');
              end
           else
              begin 
                 sql.Add('UPDATE USUARIO SET NOME_USU = :NOMEUSU, SENHA_USU = :SENHAUSU, ' +
                         'COD_GRUPO = :CODGRUPO, OPERADOR_CAIXA = :OPERADOR ' +
                         'WHERE COD_USU = :CODUSU');
              end;
           Parambyname('codusu').AsInteger     := strtoint(cod_usu.Text);
           Parambyname('nomeusu').AsString     := edtnome.Text;
           Parambyname('senhausu').AsString    := edtsenha.Text;
           Parambyname('codgrupo').AsInteger   := strtoint(Cod_grupo.Text);
           if CheckOperador.Checked then
              Parambyname('operador').AsString := 'S'
           else
              Parambyname('operador').AsString := 'N';
           ExecOrOpen;
        end;
      IBTRUsu.Commit;
      Botoes('G');
      panel3.Enabled:= false;
      panel4.Enabled:= true;
      cod_emp.SetFocus;
    except
      IBTRUsu.Rollback;
      AlertaCad('Erro ao Gravar o Usuário');
      panel3.Enabled:= true;
      panel4.Enabled:= false;
    end;
  finally
    IBSQLUsu.Close;
    BuscaItem;
  end;
end;

procedure TFrmCadUsu.BtnExcluirClick(Sender: TObject);
begin 
  inherited;
  excluir(FrmCadUsu, 'usuario', cod_usu, IBSQLUsu, IBTRUsu);
  ToolBar1.SetFocus;
  Botoes('E');
  panel3.Enabled:= false;
  panel4.Enabled:= false;
end;

procedure TFrmCadUsu.BtnGravaClick(Sender: TObject);
begin 
  inherited;
  if cod_emp.Text = '' then
     begin 
        AlertaCad('Digite o Código da Empresa');
//        cod_emp.SetFocus;
        exit;
     end;
  if IBTRUsu.Active then
     IBTRUsu.Commit;
  ibtrusu.StartTransaction;
  try
    try
      with IBSQLUsuEmp do
         begin 
            close;
            sql.Clear;
            sql.Add('INSERT INTO EMPRESA_USUARIO (COD_USU, COD_EMP) VALUES (:CODUSU, :CODEMP)');
            Parambyname('codusu').AsInteger:= strtoint(cod_usu.Text);
            Parambyname('codemp').AsInteger:= strtoint(cod_emp.Text);
            ExecOrOpen;
         end;
      IBTRUsu.Commit;
    except
      ibtrusu.Rollback;
      AlertaCad('erro ao gravar a empresa/usuário' + #13 +
                  'Verifique se já foi gravado');
    end;
  finally
    IBSQLUsuEmp.Close;
    BuscaItem;
    cod_emp.Clear;
    EdtNomeEmp.Clear;
    cod_emp.SetFocus;
  end;
end;

procedure TFrmCadUsu.BtnExcluiClick(Sender: TObject);
begin 
  inherited;
  if application.MessageBox('Confirma a Exclusão?', 'Exclusão', mb_applmodal + mb_iconquestion + mb_yesno + mb_defbutton2) = 6 then
     begin 
        try
          try
            with IBSQLUsuEmp do
              begin 
                 close;
                 sql.Clear;
                 sql.Add('DELETE FROM EMPRESA_USUARIO WHERE COD_USU = :CODUSU AND COD_EMP = :CODEMP');
                 Parambyname('codusu').AsInteger  := strtoint(cod_usu.Text);
                 Parambyname('codemp').AsInteger  := QBuscaItensCOD_EMP.value;
                 ExecOrOpen;
              end;
            IBTRUsu.Commit;
          except
            IBTRUsu.Rollback;
            AlertaCad('Erro ao Excluir a Empresa/Usuário');
          end;
        finally
          IBSQLUsuEmp.Close;
          BuscaItem;
        end;
     end;
end;

procedure TFrmCadUsu.BtnNovoClick(Sender: TObject);
begin 
  inherited;
  if IBTRUsu.Active then
     IBTRUsu.Commit;
  QBuscaItens.Close;
  bGrava:= true;
  Botoes('N');
  Panel3.Enabled:= true;
  Panel4.Enabled:= false;
  edtnome.SetFocus;
end;

procedure TFrmCadUsu.BtnConsultarClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsUsu, FrmConsUsu);
  FrmConsUsu.tag:= 0;
  FrmConsUsu.showmodal;
end;

procedure TFrmCadUsu.BtnConsGrupoClick(Sender: TObject);
begin 
  inherited;
  Application.CreateForm(TFrmConsGrupoUsuario, FrmConsGrupoUsuario);
  FrmConsGrupoUsuario.tag:= 1;
  FrmConsGrupoUsuario.ShowModal;
end;

procedure TFrmCadUsu.Cod_grupoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
  inherited;
  if key = vk_f3 then
     BtnConsGrupo.Click;
end;

procedure TFrmCadUsu.Cod_grupoExit(Sender: TObject);
begin 
  inherited;
  if ToolBar1.Focused then
     exit;
  EdtNomeGrupo.Text:= consulta('grupo_usuario', cod_grupo, 'cod_grupo', 'nome_grupo', dm.IBTransaction, dm.qConsulta);
  if EdtNomeGrupo.Text = '' then
     begin 
        AlertaCad('Grupo de Usuário não Cadastrado');
//        Cod_grupo.SetFocus;
     end;
end;

procedure TFrmCadUsu.cod_empEnter(Sender: TObject);
begin 
  inherited;
  cod_emp.SelectAll;
end;

procedure TFrmCadUsu.Cod_grupoEnter(Sender: TObject);
begin 
  inherited;
  cod_grupo.SelectAll;
end;

end.
