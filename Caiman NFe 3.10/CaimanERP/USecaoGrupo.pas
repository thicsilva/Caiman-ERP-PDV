unit USecaoGrupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, DB, StdCtrls, Grids, DBGrids, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmSecaoGrupo = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    Label30: TLabel;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    EdtNomeGrupo: TEdit;
    EdtCodGrupo: UNovosComponentes.TEdit;
    BtnGravaGrupo: TButton;
    BtnExcluiGrupo: TButton;
    EdtCodSubGrupo: UNovosComponentes.TEdit;
    EdtNomeSubGrupo: TEdit;
    Button1: TButton;
    Button2: TButton;
    QGrupo: TFDQuery;
    DSGrupo: TDataSource;
    IBTRGrupo: TFDTransaction;
    QGrupoCOD_SEC: TIntegerField;
    QGrupoCOD_GRUPO: TIntegerField;
    QGrupoDESCRICAO: TStringField;
    QSub: TFDQuery;
    DSSub: TDataSource;
    IBTRSub: TFDTransaction;
    QSubCOD_SEC: TIntegerField;
    QSubCOD_GRUPO: TIntegerField;
    QSubCOD_SUBGRUPO: TIntegerField;
    QSubDESCRICAO: TStringField;
    QOrdem: TFDQuery;
    procedure BuscaGrupo;
    procedure BuscaSubGrupo;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnGravaGrupoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BtnExcluiGrupoClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    function  OrdemGrupo : integer;
    function  OrdemSubGrupo : integer;
    procedure QGrupoAfterScroll(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure EdtCodGrupoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSecaoGrupo: TFrmSecaoGrupo;

implementation
uses
  Udm, Ubibli1, UCadSecao, UNovoPrincipal;
var  bGravaGrupo, bGravaSub : boolean;

{$R *.dfm}

function TFrmSecaoGrupo.OrdemGrupo : integer;
begin 
   if dm.IBTRAux.Active then
      dm.IBTRAux.Commit;
   dm.IBTRAux.StartTransaction;
   with QOrdem do
      begin 
         close;
         sql.Clear;
         sql.add('SELECT MAX(COD_GRUPO) CODIGO ' +
                 'FROM SECAO_GRUPO ' +
                 'WHERE COD_SEC = :CODSEC');
         Parambyname('codsec').AsInteger:= strtoint(FrmCadSecao.cod_sec.Text);
         Open;
         result:= fieldbyname('codigo').AsInteger + 1;
      end;
   dm.IBTRAux.Commit;
   QOrdem.Close;
end;

function TFrmSecaoGrupo.OrdemSubGrupo : integer;
begin 
   if dm.IBTRAux.Active then
      dm.IBTRAux.Commit;
   dm.IBTRAux.StartTransaction;
   with QOrdem do
      begin 
         close;
         sql.Clear;
         sql.add('SELECT MAX(COD_SUBGRUPO) CODIGO ' +
                 'FROM SECAO_GRUPO_SUBGRUPO ' +
                 'WHERE COD_SEC = :CODSEC AND COD_GRUPO = :CODGRUPO');
         Parambyname('codsec').AsInteger   := QGrupoCOD_SEC.AsInteger;;
         Parambyname('codgrupo').AsInteger := QGrupoCOD_GRUPO.AsInteger;;
         Open;
         result:= fieldbyname('codigo').AsInteger + 1;
      end;
   dm.IBTRAux.Commit;
   QOrdem.Close;
end;

procedure TFrmSecaoGrupo.BuscaGrupo;
begin 
   if IBTRGrupo.Active then
      IBTRGrupo.Commit;
   IBTRGrupo.StartTransaction;
   with QGrupo do
      begin 
         close;
         parambyname('codsec').AsInteger:= strtoint(FrmCadSecao.cod_sec.Text);
         open;
      end;
end;

procedure TFrmSecaoGrupo.BuscaSubGrupo;
begin 
   if IBTRSub.Active then
      IBTRSub.Commit;
   IBTRSub.StartTransaction;
   with QSub do
      begin 
         close;
         parambyname('codsec').AsInteger  := QGrupoCOD_SEC.AsInteger;
         parambyname('codgrupo').AsInteger:= QGrupoCOD_GRUPO.AsInteger;
         open;
      end;
end;

procedure TFrmSecaoGrupo.FormShow(Sender: TObject);
begin 
   bGravaGrupo:= true;
   bGravaSub  := true;
   BuscaGrupo;
   BuscaSubGrupo;
   EdtCodGrupo.ReadOnly   := false;
   EdtCodSubGrupo.ReadOnly:= false;
   EdtCodGrupo.SetFocus;
end;

procedure TFrmSecaoGrupo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if IBTRGrupo.Active then
      IBTRGrupo.Commit;
   if IBTRSub.Active then
      IBTRSub.Commit;
   QGrupo.Close;
   QSub.Close;
   Action:= caFree;
end;

procedure TFrmSecaoGrupo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmSecaoGrupo.BtnGravaGrupoClick(Sender: TObject);
begin 
   if trim(EdtNomeGrupo.Text) = '' then
      begin 
         AlertaCad('Digite o nome do grupo');
//         EdtNomeGrupo.SetFocus;
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
             if bGravaGrupo then
                begin 
                   sql.Add('INSERT INTO SECAO_GRUPO(COD_SEC, COD_GRUPO, DESCRICAO) ' +
                           'VALUES (:1, :2, :3)');

                   if trim(EdtCodGrupo.Text) = '' then
                      Parambyname('2').AsInteger:= OrdemGrupo
                   else
                      Parambyname('2').AsInteger:= strtoint(EdtCodGrupo.text);
                end
             else
                begin 
                   sql.Add('UPDATE SECAO_GRUPO SET DESCRICAO = :3 ' +
                           'WHERE COD_SEC = :1 AND COD_GRUPO = :2');
                   Parambyname('2').AsInteger:= QGrupoCOD_GRUPO.AsInteger;
                end;
             Parambyname('1').AsInteger:= strtoint(FrmCadSecao.cod_sec.Text);
             Parambyname('3').AsString:= trim(EdtNomeGrupo.Text);
             ExecOrOpen;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao gravar o grupo');
     end;
   finally
     dm.QConsulta.Close;
     bGravaGrupo:= true;
     BuscaGrupo;
     BuscaSubGrupo;
     EdtCodGrupo.Clear;
     EdtNomeGrupo.Clear;
     EdtCodGrupo.ReadOnly:= false;
     EdtCodGrupo.SetFocus;
   end;
end;

procedure TFrmSecaoGrupo.Button1Click(Sender: TObject);
begin 
   if trim(EdtNomeSubGrupo.Text) = '' then
      begin 
         AlertaCad('Digite o nome do subgrupo');
//         EdtNomeSubGrupo.SetFocus;
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
             if bGravaSub then
                begin 
                   sql.Add('INSERT INTO SECAO_GRUPO_SUBGRUPO(COD_SEC, COD_GRUPO, COD_SUBGRUPO, DESCRICAO) ' +
                           'VALUES (:1, :2, :3, :4)');

                   if trim(EdtCodSubGrupo.Text) = '' then
                      Parambyname('3').AsInteger:= OrdemSubGrupo
                   else
                      Parambyname('3').AsInteger:= strtoint(EdtCodSubGrupo.Text);
                end
             else
                begin 
                   sql.Add('UPDATE SECAO_GRUPO_SUBGRUPO SET DESCRICAO = :4 ' +
                           'WHERE COD_SEC = :1 AND COD_GRUPO = :2 AND COD_SUBGRUPO = :3');
                   Parambyname('3').AsInteger:= QSubCOD_SUBGRUPO.AsInteger;
                end;
             Parambyname('1').AsInteger:= QGrupoCOD_SEC.AsInteger;
             Parambyname('2').AsInteger:= QGrupoCOD_GRUPO.AsInteger;
             Parambyname('4').AsString := trim(EdtNomeSubGrupo.Text);
             ExecOrOpen;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao gravar o SubGrupo');
     end;
   finally
     dm.QConsulta.Close;
     bGravaSub:= true;
     BuscaSubGrupo;
     EdtCodSubGrupo.Clear;
     EdtNomeSubGrupo.Clear;
     EdtCodSubGrupo.ReadOnly:= false;
     EdtCodSubGrupo.SetFocus;
   end;
end;

procedure TFrmSecaoGrupo.BtnExcluiGrupoClick(Sender: TObject);
begin 
   if Application.MessageBox('Confirma a Exclusão do Grupo?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
      begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         try
           try
             with dm.QConsulta do
                begin 
                   close;
                   sql.Clear;
                   sql.add('DELETE FROM SECAO_GRUPO ' +
                           'WHERE COD_SEC = :CODSEC AND COD_GRUPO = :CODGRUPO');
                   Parambyname('codsec').AsInteger   := QGrupoCOD_SEC.AsInteger;
                   Parambyname('codgrupo').AsInteger := QGrupoCOD_GRUPO.AsInteger;
                   ExecOrOpen;
                end;
             dm.IBTransaction.Commit;
           except
             dm.IBTransaction.Rollback;
             AlertaCad('Erro ao excluir o grupo');
           end;
         finally
           dm.QConsulta.Close;
           BuscaGrupo;
           BuscaSubGrupo;
         end;
      end;
end;

procedure TFrmSecaoGrupo.Button2Click(Sender: TObject);
begin 
   if Application.MessageBox('Confirma a Exclusão do SubGrupo?', 'Atenção', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
      begin 
         if dm.IBTransaction.Active then
            dm.IBTransaction.Commit;
         dm.IBTransaction.StartTransaction;
         try
           try
             with dm.QConsulta do
                begin 
                   close;
                   sql.Clear;
                   sql.add('DELETE FROM SECAO_GRUPO_SUBGRUPO ' +
                           'WHERE COD_SEC = :CODSEC AND COD_GRUPO = :CODGRUPO AND COD_SUBGRUPO = :SUBGRUPO');
                   Parambyname('codsec').AsInteger   := QSubCOD_SEC.AsInteger;
                   Parambyname('codgrupo').AsInteger := QSubCOD_GRUPO.AsInteger;
                   Parambyname('subgrupo').AsInteger := QSubCOD_SUBGRUPO.AsInteger;
                   ExecOrOpen;
                end;
             dm.IBTransaction.Commit;
           except
             dm.IBTransaction.Rollback;
             AlertaCad('Erro ao excluir o SubGrupo');
           end;
         finally
           dm.QConsulta.Close;
           BuscaSubGrupo;
         end;
      end;
end;

procedure TFrmSecaoGrupo.QGrupoAfterScroll(DataSet: TDataSet);
begin 
   BuscaSubGrupo;
end;

procedure TFrmSecaoGrupo.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if key = #13 then
      begin 
         key:= #0;
         SelectNext(ActiveControl, true, true);
      end;
end;

procedure TFrmSecaoGrupo.DBGrid1DblClick(Sender: TObject);
begin 
   if not (QGrupoCOD_GRUPO.IsNull) then
      begin 
         bGravaGrupo:= false;
         EdtCodGrupo.ReadOnly := true;
         EdtCodGrupo.Text     := QGrupoCOD_GRUPO.AsString;
         EdtNomeGrupo.Text    := QGrupoDESCRICAO.AsString;
         EdtNomeGrupo.SetFocus;
      end;
end;

procedure TFrmSecaoGrupo.DBGrid2DblClick(Sender: TObject);
begin 
   if not (QSubCOD_SUBGRUPO.IsNull) then
      begin 
         bGravaSub:= false;
         EdtCodSubGrupo.ReadOnly := true;
         EdtCodSubGrupo.Text     := QSubCOD_SUBGRUPO.AsString;
         EdtNomeSubGrupo.Text    := QSubDESCRICAO.AsString;
         EdtNomeSubGrupo.SetFocus;
      end;
end;

procedure TFrmSecaoGrupo.EdtCodGrupoKeyPress(Sender: TObject;
  var Key: Char);
begin 
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

end.
