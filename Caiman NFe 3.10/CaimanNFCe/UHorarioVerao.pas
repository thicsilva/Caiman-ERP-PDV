unit UHorarioVerao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  TFrmHorarioVerao = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    BtnHabilitar: TButton;
    BtnDesabilitar: TButton;
    Label1: TLabel;
    Memo: TMemo;
    BtnMenuFiscal: TButton;
    procedure BtnHabilitarClick(Sender: TObject);
    procedure BtnDesabilitarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnMenuFiscalClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmHorarioVerao: TFrmHorarioVerao;

implementation
Uses UECF, Udm, UMenuFiscal;

{$R *.dfm}

procedure TFrmHorarioVerao.BtnHabilitarClick(Sender: TObject);
begin
   ProgramarHorarioVerao(iECF);
end;

procedure TFrmHorarioVerao.BtnDesabilitarClick(Sender: TObject);
begin
   ProgramarHorarioVerao(iECF);
end;

procedure TFrmHorarioVerao.FormCreate(Sender: TObject);
begin
  dm.ScaleForm( Self, False );
end;

procedure TFrmHorarioVerao.FormShow(Sender: TObject);
begin

   Memo.Clear;
   memo.Lines.Add(StatusECF(iECF, 0));
end;

procedure TFrmHorarioVerao.BtnMenuFiscalClick(Sender: TObject);
begin
   Application.CreateForm(TFrmMenuFiscal, FrmMenuFiscal);
   FrmMenuFiscal.showmodal;
end;

end.
