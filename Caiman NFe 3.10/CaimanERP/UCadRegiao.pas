unit UCadRegiao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UCadNovo, ImgList, acAlphaImageList, ComCtrls, ToolWin, ExtCtrls, DB, 
  StdCtrls, Mask, DBCtrls, Grids, DBGrids, Buttons, sSpeedButton, 
  UNovosComponentes, UNovoFormulario, cxGraphics, cxControls, cxLookAndFeels, 
  cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, dxSkinMetropolisDark, 
  dxSkinsdxStatusBarPainter, dxStatusBar, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TfrmCadRegiao = class(TFrmCadastroNovo)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    QRegiao: TFDQuery;
    IBTRRegiao: TFDTransaction;
    QRegiaoCOD: TIntegerField;
    QRegiaoDESCRICAO: TStringField;
    upRegiao: TFDUpdateSQL;
    dsRegiao: TDataSource;
    Label1: TLabel;
    dbedtCOD: TDBEdit;
    Label2: TLabel;
    dbedtDESCRICAO: TDBEdit;
    pCidades: TPanel;
    pAviso: TPanel;
    DBGrid1: TDBGrid;
    QCidades: TFDQuery;
    QCidadesCOD_REGIAO: TIntegerField;
    QCidadesCOD_MUNICIPIO: TIntegerField;
    QCidadesDESCRICAO: TStringField;
    upCidades: TFDUpdateSQL;
    dsCidades: TDataSource;
    sSpeedButton1: TsSpeedButton;
    sSpeedButton2: TsSpeedButton;
    procedure dsRegiaoDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnConsultarClick(Sender: TObject);
    procedure sSpeedButton2Click(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 function frmCadRegiao: TfrmCadRegiao;

implementation

uses
  UDM, Ubibli1, UDialog, UConsRegiao, UConsMarcas, UConsMunicipios, 
  UNovoPrincipal;

{$R *.dfm}

function frmCadRegiao: TfrmCadRegiao;
begin
   Result := TfrmCadRegiao( BuscaFormulario( TfrmCadRegiao, False ) );
end;

procedure TfrmCadRegiao.BtnAlterarClick(Sender: TObject);
begin
  inherited;
    if not dm.Acesso('C1029', 'A') then
    begin
      Application.MessageBox(
        'Você não tem permissão para efetuar esta operação.', 'Aviso',
        mb_ApplModal + MB_ICONINFORMATION + MB_OK + mb_DefButton1);
      Exit;
    end;
   QRegiao.Edit;
end;

procedure TfrmCadRegiao.BtnCancelarClick(Sender: TObject);
begin
  inherited;
  QRegiao.Cancel;
  IBTRRegiao.CommitRetaining;
end;

procedure TfrmCadRegiao.BtnConsultarClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm( TfrmConsRegiao, frmConsRegiao );
  frmConsRegiao.Tag := 1;
  frmConsRegiao.ShowModal;
end;

procedure TfrmCadRegiao.BtnExcluirClick(Sender: TObject);
begin
  inherited;
    if not dm.Acesso('C1029', 'E') then
    begin
      Application.MessageBox(
        'Você não tem permissão para efetuar esta operação.', 'Aviso',
        mb_ApplModal + MB_ICONINFORMATION + MB_OK + mb_DefButton1);
      Exit;
    end;
  if KDialog( 'Tem certeza que deseja excluir este registro?', 'Cadastro de Região', tdtPergunta ) then
      begin
         QRegiao.Delete;
         IBTRRegiao.CommitRetaining;
      end;

end;

procedure TfrmCadRegiao.BtnGravarClick(Sender: TObject);
begin
  inherited;
  if QRegiao.State = dsInsert then
     begin
         QRegiaoCOD.AsInteger := prxcod('REGIAO', 'COD', dm.IBTransaction, dm.ibsqlcod);
         QRegiao.Post;
         IBTRRegiao.CommitRetaining;
     end
  else
     QRegiao.Post;
end;

procedure TfrmCadRegiao.BtnNovoClick(Sender: TObject);
begin
  inherited;
    if not dm.Acesso('C1029', 'I') then
    begin
      Application.MessageBox(
        'Você não tem permissão para efetuar esta operação.', 'Aviso',
        mb_ApplModal + MB_ICONINFORMATION + MB_OK + mb_DefButton1);
      Exit;
    end;
  QRegiao.Insert;
end;

procedure TfrmCadRegiao.dsRegiaoDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  case QRegiao.State of
    dsInactive: begin
       BtnNovo.Enabled := False;
       BtnGravar.Enabled := False;
       BtnCancelar.Enabled := False;
       BtnAlterar.Enabled := False;
       BtnExcluir.Enabled := False;
       BtnConsultar.Enabled := False;
       pCidades.Visible := False;
       pAviso.Visible := True;
       pAviso.BringToFront;
       QCidades.Close;
    end;
    dsBrowse: begin
       BtnNovo.Enabled := True;
       BtnGravar.Enabled := False;
       BtnCancelar.Enabled := False;
       BtnAlterar.Enabled := True;
       BtnExcluir.Enabled := True;
       BtnConsultar.Enabled := True;
       pCidades.Visible := False;
       pAviso.Visible := True;
       pAviso.BringToFront;
       QCidades.Close;
    end;
    dsEdit: begin
       BtnNovo.Enabled := False;
       BtnGravar.Enabled := True;
       BtnCancelar.Enabled := True;
       BtnAlterar.Enabled := False;
       BtnExcluir.Enabled := False;
       BtnConsultar.Enabled := False;
       pCidades.Visible := True;
       pAviso.Visible := False;
       pAviso.SendToBack;
       QCidades.Close;
       QCidades.SQL.Text := 'select * from regiao_cidades where cod_regiao=:cod';
       QCidades.ParamByName( 'cod' ).AsInteger := QRegiaoCOD.AsInteger;
       QCidades.Open;

    end;
    dsInsert: begin
       BtnNovo.Enabled := False;
       BtnGravar.Enabled := True;
       BtnCancelar.Enabled := True;
       BtnAlterar.Enabled := False;
       BtnExcluir.Enabled := False;
       BtnConsultar.Enabled := False;
       pCidades.Visible := False;
       pAviso.Visible := True;
       pAviso.BringToFront;
       QCidades.Close;
    end;
  end;

end;

procedure TfrmCadRegiao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmCadRegiao.FormShow(Sender: TObject);
begin
  inherited;
  PageControl1.TabIndex := 0;
   if Tag = 0 then
      begin
         if IBTRRegiao.Active then
            IBTRRegiao.Commit;
        IBTRRegiao.StartTransaction;
        QRegiao.Close;
        QRegiao.SQL.Text := 'select * from regiao';
        QRegiao.Open;
        QRegiao.Insert;
      end;
end;

procedure TfrmCadRegiao.sSpeedButton1Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm( TFrmConsMunicipios, FrmConsMunicipios );
  FrmConsMunicipios.Tag := 5;
  FrmConsMunicipios.ShowModal;
end;

procedure TfrmCadRegiao.sSpeedButton2Click(Sender: TObject);
begin
  inherited;
  if QCidadesCOD_REGIAO.IsNull then
     Exit;
  QCidades.Delete;
end;

end.



