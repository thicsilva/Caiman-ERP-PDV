unit UConsUsu;

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
  TFrmConsUsu = class(TFrmConsNovo)
    QConsUsu: TFDQuery;
    DSQConsUsu: TDataSource;
    QConsUsuCOD_USU: TIntegerField;
    QConsUsuNOME_USU: TStringField;
    QConsUsuSENHA_USU: TStringField;
    QConsUsuCOD_GRUPO: TIntegerField;
    QConsUsuNOME_GRUPO: TStringField;
    QConsUsuOPERADOR_CAIXA: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsUsu: TFrmConsUsu;

implementation
uses
  Udm, Ubibli1, UCadUsuario, UCadSetorEstoque;

{$R *.dfm}

procedure TFrmConsUsu.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  QConsUsu.Close;
  Action:= caFree;
end;

procedure TFrmConsUsu.BtnOkClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with QConsUsu do
     begin 
        close;
        sql.Clear;
        sql.Add('SELECT U.*, G.NOME_GRUPO ' +
                'FROM USUARIO U ' +
                'INNER JOIN GRUPO_USUARIO G ' +
                'ON (U.COD_GRUPO = G.COD_GRUPO)');
        case ComboCons.ItemIndex of
         0: sql.add(' WHERE NOME_USU LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_USU');
         1: sql.add(' WHERE NOME_USU LIKE ' + #39 +
                      edtcons.Text + '%' + #39 + ' ORDER BY NOME_USU');
         2:begin 
              if EdtCons.Text = '' then
                 sql.add(' ORDER BY COD_USU')
              else
                 sql.add(' WHERE COD_USU = ' + edtcons.Text);
           end;
        end;
        open;
     end;
  dbgrid.SetFocus;
end;

procedure TFrmConsUsu.BtnLocalizarClick(Sender: TObject);
begin 
  inherited;
  case tag of
   0: begin 
         with FrmCadUsu do
            begin 
               tag:= 1;
               limpaedit(FrmCadUsu);
               cod_usu.Text      := QConsUsuCOD_USU.AsString;
               edtnome.Text      := QConsUsuNOME_USU.AsString;
               edtsenha.Text     := QConsUsuSENHA_USU.AsString;
               Cod_grupo.Text    := QConsUsuCOD_GRUPO.AsString;
               EdtNomeGrupo.Text := QConsUsuNOME_GRUPO.AsString;
               if trim(QConsUsuOPERADOR_CAIXA.AsString) = 'S' then
                  CheckOperador.Checked:= true
               else
                  CheckOperador.Checked:= false;
               BuscaItem;
               panel3.Enabled:= false;
               panel4.Enabled:= false;
               FormShow(sender);
               show;
            end;
         close;
      end;
   1: begin 
         with FrmCadSetorEstoque do
            begin 
               EdtCodUsu.Text := QConsUsuCOD_USU.AsString;
               EdtNomeUsu.Text:= QConsUsuNOME_USU.AsString;
            end;
         close;
      end;
  end;
end;

end.
