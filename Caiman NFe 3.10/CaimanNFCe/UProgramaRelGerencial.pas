unit UProgramaRelGerencial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls;

type
  TFrmProgramaRelGerencial = class(TForm)
    Panel2: TPanel;
    BtnGravar: TButton;
    BtnCancelar: TButton;
    BtnMenuFiscal: TButton;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    EdtIndice: TEdit;
    Label2: TLabel;
    EdtDescricao: TEdit;
    Label3: TLabel;
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnMenuFiscalClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtIndiceKeyPress(Sender: TObject; var Key: Char);
    procedure BtnGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmProgramaRelGerencial: TFrmProgramaRelGerencial;

implementation

uses UMenuFiscal, UECF, UDM;

{$R *.dfm}

procedure TFrmProgramaRelGerencial.BtnCancelarClick(Sender: TObject);
begin
   close;
end;

procedure TFrmProgramaRelGerencial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:= caFree;
   Self := nil;
end;

procedure TFrmProgramaRelGerencial.FormCreate(Sender: TObject);
begin
  dm.ScaleForm( Self, False );
end;

procedure TFrmProgramaRelGerencial.BtnMenuFiscalClick(Sender: TObject);
begin
   Application.CreateForm(TFrmMenuFiscal, FrmMenuFiscal);
   FrmMenuFiscal.showmodal;
end;

procedure TFrmProgramaRelGerencial.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = vk_escape then
      close;
end;

procedure TFrmProgramaRelGerencial.EdtIndiceKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (key in ['0'..'9', #13, #8]) then
      key:= #0;
end;

procedure TFrmProgramaRelGerencial.BtnGravarClick(Sender: TObject);
begin
   ProgramaRelatorioGerencial(iECF, trim(EdtIndice.Text), trim(EdtDescricao.Text));
end;

end.
