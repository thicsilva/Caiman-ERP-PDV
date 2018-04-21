unit UConsTeclasAtalho;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UConsNovo, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, ExtCtrls;

type
  TfrmConsTeclasAtalho = class(TFrmConsNovo)
    procedure BtnOKClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsTeclasAtalho: TfrmConsTeclasAtalho;

implementation

uses UDM, UCadTeclasAtalho, Ubibli1;

{$R *.dfm}

procedure TfrmConsTeclasAtalho.BtnLocalizarClick(Sender: TObject);
begin
  inherited;
  case Tag of
     0: begin
           Limpaedit( frmConsTeclasAtalho );
           frmCadTeclasAtalho.edtTecla.Text := DM.QTeclasTECLA.AsString;
           frmCadTeclasAtalho.edtDescricao.Text := DM.QTeclasDESCRICAO.AsString;
           frmCadTeclasAtalho.Botoes('G');
           Close;
        end;
  end;
end;

procedure TfrmConsTeclasAtalho.BtnOKClick(Sender: TObject);
begin
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QTeclas do
     begin
        close;
        sql.Clear;
        sql.add('SELECT * ' +
                'FROM GRUPO_TECLAS');
        case ComboCons.ItemIndex of
         0: sql.add(' WHERE DESCRICAO LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' ORDER BY DESCRICAO');
         1: sql.add(' WHERE DESCRICAO LIKE ' + #39 +
                      edtcons.Text + '%' + #39 + ' ORDER BY DESCRICAO');
         2: begin
               if EdtCons.Text = '' then
                  sql.add(' ORDER BY TECLA')
               else
                  sql.add(' WHERE TECLA = ' + edtcons.Text);
            end;
        end;
        open;
     end;
  dbgrid.SetFocus;

end;

end.
