unit UAlterarSecaoGrupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, Buttons, StdCtrls, UNovosComponentes, 
  UNovoFormulario, sSpeedButton;

type
  TFrmAlterarSecao = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    EdtCodSec: UNovosComponentes.TEdit;
    BtnConsSec: TsSpeedButton;
    EdtNomeSec: TEdit;
    BtnOK: TButton;
    BtnCancelar: TButton;
    Label1: TLabel;
    EdtCodGrupo: UNovosComponentes.TEdit;
    BtnConsGrupo: TsSpeedButton;
    EdtNomeGrupo: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    EdtCodSub: UNovosComponentes.TEdit;
    BtnConsSub: TsSpeedButton;
    EdtNomeSub: TEdit;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label5: TLabel;
    EdtCodSetor: UNovosComponentes.TEdit;
    BtnConsSetor: TsSpeedButton;
    EdtNomeSetor: TEdit;
    Label8: TLabel;
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsSecClick(Sender: TObject);
    procedure EdtCodSecEnter(Sender: TObject);
    procedure EdtCodSecExit(Sender: TObject);
    procedure EdtCodSecKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodSecKeyPress(Sender: TObject; var Key: Char);
    procedure BtnOKClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodGrupoEnter(Sender: TObject);
    procedure EdtCodGrupoExit(Sender: TObject);
    procedure EdtCodGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsGrupoClick(Sender: TObject);
    procedure EdtCodSubEnter(Sender: TObject);
    procedure EdtCodSubExit(Sender: TObject);
    procedure EdtCodSubKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConsSubClick(Sender: TObject);
    procedure EdtCodSetorEnter(Sender: TObject);
    procedure EdtCodSetorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodSetorExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAlterarSecao: TFrmAlterarSecao;

implementation
uses
  Udm, Ubibli1, UAlteraPreco, UConsSecao, UConsGrupo, UConsSubGrupo, 
  UNovoPrincipal;

{$R *.dfm}

procedure TFrmAlterarSecao.BtnCancelarClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmAlterarSecao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.QConsulta.close;
   Action:= caFree;
end;

procedure TFrmAlterarSecao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmAlterarSecao.BtnConsSecClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsSecao, FrmConsSecao);
   FrmConsSecao.Tag:= 19;
   FrmConsSecao.ShowModal;
end;

procedure TFrmAlterarSecao.EdtCodSecEnter(Sender: TObject);
begin 
   EdtCodSec.SelectAll;
end;

procedure TFrmAlterarSecao.EdtCodSecExit(Sender: TObject);
begin 
   if BtnCancelar.Focused then
     exit;

   EdtNomeSec.Text:= consulta('secao', EdtCodSec, 'cod_sec', 'nome_sec', dm.IBTransaction, dm.qConsulta);
   if EdtNomeSec.Text = '' then
      begin 
         AlertaCad('Seção não Cadastrada');
//         EdtCodSec.SetFocus;
      end;
end;

procedure TFrmAlterarSecao.EdtCodSecKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsSec.Click;
end;

procedure TFrmAlterarSecao.EdtCodSecKeyPress(Sender: TObject; var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmAlterarSecao.BtnOKClick(Sender: TObject);
var iAux : integer;
begin 
   { verificar se tem algum selecionado }
   iAux:= 0;
   with FrmAlteraPreco.QConsProd do
      begin 
         DisableControls;
         First;
         while not eof do
           begin 
              if FrmAlteraPreco.DBGrid.SelectedRows.CurrentRowSelected then
                 begin 
                    iAux:= 1;
                    Break;
                 end;
              next;
           end;
         First;
         EnableControls;
      end;

   if not (iAux > 0) then
      begin 
         AlertaCad('Nenhum produto selecionado');
         exit;
      end;

   if Application.MessageBox('Confirma a Atualização da Seção?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
      begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         dm.QConsulta.close;
         dm.QConsulta.SQL.Clear;
         dm.QConsulta.sql.Text:= 'UPDATE PRODUTO SET COD_SEC = :1, COD_GRUPO = :2, ' +
                                 'SUB_GRUPO = :3, CODIGO_SETOR_ESTOQUE = :4 WHERE COD_PRO = :5';
         with FrmAlteraPreco.QConsProd do
            begin 
               DisableControls;
               First;
               while not eof do
                  begin 
                     if FrmAlteraPreco.DBGrid.SelectedRows.CurrentRowSelected then
                        begin 
                           iAuxCodPro:= FrmAlteraPreco.QConsProdCODPRO.AsInteger;
                           dm.QConsulta.Close;
                           dm.QConsulta.Parambyname('1').AsInteger:= strtoint(EdtCodSec.Text);

                           if trim(EdtCodGrupo.Text) = '' then
                              dm.QConsulta.Parambyname('2').Value:= null
                           else
                              dm.QConsulta.Parambyname('2').AsInteger:= strtoint(EdtCodGrupo.Text);

                           if trim(EdtCodSub.Text) = '' then
                              dm.QConsulta.Parambyname('3').Value:= null
                           else
                              dm.QConsulta.Parambyname('3').AsInteger:= strtoint(EdtCodSub.Text);

                           dm.QConsulta.ParamByName('4').AsInteger   := strtoint(EdtCodSetor.Text);

                           dm.QConsulta.Parambyname('5').AsInteger   := FrmAlteraPreco.QConsProdCODPRO.AsInteger;
                           dm.QConsulta.ExecOrOpen;
                        end;
                     next;
                  end;
               EnableControls;
            end;
         dm.IBTransaction.Commit;
         dm.QConsulta.Close;
         dm.QConsulta.SQL.Clear;
         FrmAlteraPreco.BtnOk.Click;
      end;
   close;
end;

procedure TFrmAlterarSecao.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if key = #13 then
      begin 
         key:= #0;
         SelectNext(ActiveControl, true, true);
      end;
end;

procedure TFrmAlterarSecao.EdtCodGrupoEnter(Sender: TObject);
begin 
   EdtCodGrupo.SelectAll;
end;

procedure TFrmAlterarSecao.EdtCodGrupoExit(Sender: TObject);
begin 
   if (BtnCancelar.Focused) or (EdtCodSec.Text = '') or (EdtCodGrupo.Text = '') then
      begin 
         EdtNomeGrupo.Clear;
         exit;
      end;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin 
             close;
             sql.Clear;
             sql.add('SELECT COD_GRUPO, DESCRICAO ' +
                     'FROM SECAO_GRUPO ' +
                     'WHERE COD_GRUPO = :1 AND COD_SEC = :2');
             Parambyname('1').AsInteger:= strtoint(EdtCodGrupo.Text);
             Parambyname('2').AsInteger:= strtoint(EdtCodSec.Text);
             Open;
             if not (fieldbyname('cod_grupo').IsNull) then
                begin 
                   EdtCodGrupo.Text := fieldbyname('cod_grupo').AsString;
                   EdtNomeGrupo.Text:= fieldbyname('descricao').AsString;
                end
             else
                begin 
                   EdtCodGrupo.Clear;
                   EdtNomeGrupo.Clear;
                   AlertaCad('Grupo não Cadastrado');
//                   EdtCodGrupo.SetFocus;
                end;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar o grupo');
     end;
   finally
     dm.QConsulta.Close;
   end;
end;

procedure TFrmAlterarSecao.EdtCodGrupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsGrupo.Click;
end;

procedure TFrmAlterarSecao.BtnConsGrupoClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsGrupo, FrmConsGrupo);
   FrmConsGrupo.tag:= 2;
   FrmConsGrupo.showmodal;
end;

procedure TFrmAlterarSecao.EdtCodSubEnter(Sender: TObject);
begin 
   EdtCodSub.SelectAll;
end;

procedure TFrmAlterarSecao.EdtCodSubExit(Sender: TObject);
begin 
   if (BtnCancelar.Focused) or (EdtCodSec.Text = '') or (EdtCodGrupo.Text = '') or (EdtCodSub.Text = '') then
      begin 
         EdtNomeSub.Clear;
         exit;
      end;
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin 
             close;
             sql.Clear;
             sql.add('SELECT COD_SUBGRUPO, DESCRICAO ' +
                     'FROM SECAO_GRUPO_SUBGRUPO ' +
                     'WHERE COD_SUBGRUPO = :1 AND COD_GRUPO = :2 AND COD_SEC = :3');
             Parambyname('1').AsInteger:= strtoint(EdtCodSub.Text);
             Parambyname('2').AsInteger:= strtoint(EdtCodGrupo.Text);
             Parambyname('3').AsInteger:= strtoint(EdtCodSec.Text);
             Open;
             if not (fieldbyname('cod_subgrupo').IsNull) then
                begin 
                   EdtCodSub.Text := fieldbyname('cod_subgrupo').AsString;
                   EdtNomeSub.Text:= fieldbyname('descricao').AsString;
                end
             else
                begin 
                   EdtCodSub.Clear;
                   EdtNomeSub.Clear;
                   AlertaCad('SubGrupo não Cadastrado');
//                   EdtCodSub.SetFocus;
                end;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar o SubGrupo');
     end;
   finally
     dm.QConsulta.Close;
   end;
end;

procedure TFrmAlterarSecao.EdtCodSubKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsSub.Click;
end;

procedure TFrmAlterarSecao.BtnConsSubClick(Sender: TObject);
begin 
   Application.CreateForm(TFrmConsSubGrupo, FrmConsSubGrupo);
   FrmConsSubGrupo.tag:= 2;
   FrmConsSubGrupo.showmodal;
end;

procedure TFrmAlterarSecao.EdtCodSetorEnter(Sender: TObject);
begin 
   EdtCodSetor.SelectAll;
end;

procedure TFrmAlterarSecao.EdtCodSetorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin 
   if key = vk_f3 then
      BtnConsSetor.Click;
end;

procedure TFrmAlterarSecao.EdtCodSetorExit(Sender: TObject);
begin 
  if BtnCancelar.Focused then
     exit;

   EdtNomeSetor.Text:= consulta('setores_estoque', EdtCodSetor, 'codigo', 'descricao', dm.IBTransaction, dm.qConsulta);
   if trim(EdtNomeSetor.Text) = '' then
      begin 
         AlertaCad('Setor não Cadastrado');
//         EdtCodSetor.SetFocus;
      end;
end;

end.
