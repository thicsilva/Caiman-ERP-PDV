unit UConsGrupoUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UConsNovo, ComCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, DB, Buttons, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinsdxStatusBarPainter, dxStatusBar;

type
  TFrmConsGrupoUsuario = class(TFrmConsNovo)
    QConsGrupoUsuario: TFDQuery;
    DSQConsGrupoUsuario: TDataSource;
    QConsGrupoUsuarioCOD_GRUPO: TIntegerField;
    QConsGrupoUsuarioNOME_GRUPO: TStringField;
    QConsGrupoUsuarioSUPER_GRUPO: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsGrupoUsuario: TFrmConsGrupoUsuario;

implementation
uses
  Udm, UCadGrupoUsuario, Ubibli1, UCadUsuario, UAcesso;

{$R *.dfm}

procedure TFrmConsGrupoUsuario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  QConsGrupoUsuario.Close;
  Action:= caFree;
end;

procedure TFrmConsGrupoUsuario.BtnOkClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with QConsGrupoUsuario do
     begin 
        close;
        sql.Clear;
        sql.add('SELECT * FROM GRUPO_USUARIO');
        case ComboCons.ItemIndex of
         0: sql.Add(' WHERE NOME_GRUPO LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_GRUPO');
         1: sql.Add(' WHERE NOME_GRUPO LIKE ' + #39 +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_GRUPO');
         2: begin 
              if EdtCons.Text = '' then
                 sql.add(' ORDER BY COD_GRUPO')
              else
                 sql.add(' WHERE COD_GRUPO = ' + edtcons.Text);
           end;
        end;
        open;
     end;
  dbgrid.SetFocus;
end;

procedure TFrmConsGrupoUsuario.BtnLocalizarClick(Sender: TObject);
begin 
  inherited;
  if tag = 0 then
     begin 
        with FrmCadGrupoUsuario do
           begin 
              tag:= 1;
              limpaedit(FrmCadGrupoUsuario);
              ededit(FrmCadGrupoUsuario, false);
              cod_grupo.Text  := QConsGrupoUsuarioCOD_GRUPO.AsString;
              edtnome.Text    := QConsGrupoUsuarioNOME_GRUPO.Value;
              if trim(QConsGrupoUsuarioSUPER_GRUPO.Value) = 'S' then
                 CheckGrupo.Checked:= true
              else
                 CheckGrupo.Checked:= false;
              FormShow(sender);
              show;
           end;
        close;
     end
  else
     if tag = 1 then
        begin 
           with FrmCadUsu do
              begin 
                 Cod_grupo.Text    := QConsGrupoUsuarioCOD_GRUPO.AsString;
                 EdtNomeGrupo.Text := QConsGrupoUsuarioNOME_GRUPO.Value;
              end;
           close;
        end
     else
        if tag = 2 then
           begin 
              with FrmAcesso do
                 begin 
                    Cod_grupo.Text    := QConsGrupoUsuarioCOD_GRUPO.AsString;
                    Cod_grupo.SetFocus;
                 end;
              close;
           end;
end;

end.
