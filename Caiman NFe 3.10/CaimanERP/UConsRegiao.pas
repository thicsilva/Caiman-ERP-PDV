unit UConsRegiao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UConsNovo, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, ExtCtrls, 
  UNovosComponentes, UNovoFormulario, cxGraphics, cxControls, cxLookAndFeels, 
  cxLookAndFeelPainters, dxSkinsCore, dxSkinMetropolis, dxSkinMetropolisDark, 
  dxSkinsdxStatusBarPainter, dxStatusBar;

type
  TfrmConsRegiao = class(TFrmConsNovo)
    procedure FormShow(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnLocalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsRegiao: TfrmConsRegiao;

implementation

uses
  UDM, UCadRegiao, UCadVend, URelVendas, UNovoPrincipal;

{$R *.dfm}

procedure TfrmConsRegiao.BtnLocalizarClick(Sender: TObject);
begin 
  inherited;
   if DM.QRegiaoCOD.IsNull then
       exit;
   case Tag of
      1: begin
          BuscaFormulario( TfrmCadRegiao, True );
          frmCadRegiao.QRegiao.Close;
          frmCadRegiao.QRegiao.SQL.Text := 'select * from regiao where cod=:cod';
          frmCadRegiao.QRegiao.ParamByName( 'cod' ).AsInteger := dm.QRegiaoCOD.AsInteger;
          frmCadRegiao.QRegiao.Open;
          dm.IBTransaction.Commit;
          Close;
      end;
      2: begin 
         FrmCadVend.edtCodregiao.Text := dm.QRegiaoCOD.AsString;
         FrmCadVend.edtRegiao.Text := dm.QRegiaoDESCRICAO.AsString;
         close;
      end;
      3: begin 
         FrmRelVendas.Regiao := dm.QRegiaoCOD.AsInteger;
         FrmRelVendas.RegiaoDescricao := dm.QRegiaoDESCRICAO.AsString;
         ModalResult := mrOk;

      end;
   end;
end;

procedure TfrmConsRegiao.BtnOKClick(Sender: TObject);
begin 
  inherited;
  if dm.IBTransaction.Active then
     dm.IBTransaction.Commit;
  DM.IBTransaction.StartTransaction;

  dm.QRegiao.Close;
  dm.QRegiao.SQL.Text := 'select * from regiao where descricao like :param';
  if EdtCons.Text = '' then
     dm.QRegiao.ParamByName( 'param' ).AsString := '%'
  else
     dm.QRegiao.ParamByName( 'param' ).AsString := EdtCons.Text;
  dm.QRegiao.Open;

end;

procedure TfrmConsRegiao.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
  inherited;
   dm.QRegiao.Close;
   Action := caFree;
end;

procedure TfrmConsRegiao.FormShow(Sender: TObject);
begin 
  inherited;
   ComboCons.ItemIndex := 0;
end;

end.
