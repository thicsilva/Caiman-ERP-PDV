unit UConsMunicipios;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, UConsNovo, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, ExtCtrls, UNovosComponentes, UNovoFormulario,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinsdxStatusBarPainter, dxStatusBar,
  Data.DB;

type
  TFrmConsMunicipios = class(TFrmConsNovo)
    procedure BtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOKClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsMunicipios: TFrmConsMunicipios;

implementation
Uses Udm, UCadCli, UCadEmp, UCadFor, URelVendas, UCadRegiao, UNovoPrincipal;

{$R *.dfm}

procedure TFrmConsMunicipios.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmConsMunicipios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.QMunicipio.Close;

  {grava a posicao do combo}
  dm.GravaIni('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsMunicipios.ComboCons', inttostr(ComboCons.itemIndex));
  Action:= caFree;
end;

procedure TFrmConsMunicipios.BtnOKClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  dm.IBTransaction.StartTransaction;
  with dm.QMunicipio do
     begin 
        close;
        sql.Clear;
        sql.add('SELECT * FROM MUNICIPIOS');
        case ComboCons.ItemIndex of
         0: sql.add(' WHERE DESCRICAO LIKE ' + #39 + '%' +
                      edtcons.Text + '%' + #39 + ' ORDER BY DESCRICAO');
         1: sql.add(' WHERE DESCRICAO LIKE ' + #39 +
                      edtcons.Text + '%' + #39 + ' ORDER BY DESCRICAO');
         2: begin 
              if EdtCons.Text = '' then
                 sql.add(' ORDER BY CODIGO_MUNICIPIO')
              else
                 sql.add(' WHERE CODIGO_MUNICIPIO = ' + edtcons.Text);
            end;
        end;
        open;
     end;
  dbgrid.SetFocus;
end;

procedure TFrmConsMunicipios.BtnLocalizarClick(Sender: TObject);
var i : integer;
begin 
  inherited;
  case FrmConsMunicipios.Tag of
    1: begin 
          with FrmCadCli do
             begin 
                EdtIBGE.Text   := dm.QMunicipioCODIGO_MUNICIPIO.AsString;
                EdtCidRes.Text := dm.QMunicipioDESCRICAO.AsString;
                for i:= 0 to 26 do
                     begin 
                        if ComboEstRes.Items[i] = dm.QMunicipioUF.AsString then
                           begin 
                              ComboEstRes.ItemIndex:= i;
                              Break;
                           end;
                     end;
                EdtCepRes.SetFocus;
             end;
          close;
       end;
    2: begin 
          TFrmCadEmp(frmMenu.FTDI.MostrarFormulario( TFrmCadEmp, False ) ).EdtCodigoMunicipio.Text:= dm.QMunicipioCODIGO_MUNICIPIO.AsString;
          close;
       end;
    3: begin 
          with FrmCadFor do
             begin 
                EdtIBGE.Text:= dm.QMunicipioCODIGO_MUNICIPIO.AsString;
                EdtCid.Text := dm.QMunicipioDESCRICAO.AsString;
                for i:= 0 to 26 do
                     begin 
                        if ComboEst.Items[i] = dm.QMunicipioUF.AsString then
                           begin 
                              ComboEst.ItemIndex:= i;
                              Break;
                           end;
                     end;
                EdtCep.SetFocus;
             end;
          close;
       end;
    4: begin 
          FrmRelVendas.CIDADE := dm.QMunicipioDESCRICAO.AsString;
          close;
       end;
    5: begin 
          frmCadRegiao.QCidades.Insert;
          frmCadRegiao.QCidadesCOD_REGIAO.AsInteger := frmCadRegiao.QRegiaoCOD.AsInteger;
          frmCadRegiao.QCidadesCOD_MUNICIPIO.AsInteger := dm.QMunicipioCODIGO_MUNICIPIO.AsInteger;
          frmCadRegiao.QCidadesDESCRICAO.AsString := dm.QMunicipioDESCRICAO.AsString;
          frmCadRegiao.QCidades.Post;
          frmCadRegiao.IBTRRegiao.CommitRetaining;
          close;
       end;
  end;
end;

procedure TFrmConsMunicipios.FormShow(Sender: TObject);
begin 
  inherited;
  {busca a posicao do combo}
  try
    ComboCons.ItemIndex:= strtoint(dm.LeINI('cnfcomercio.ini', 'PosicaoCombobox', 'FrmConsMunicipios.ComboCons'));
  except
    ComboCons.ItemIndex:= 0;
  end;
end;

end.

