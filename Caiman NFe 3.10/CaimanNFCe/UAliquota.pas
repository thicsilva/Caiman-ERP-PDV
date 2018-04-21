unit UAliquota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Mask, rxToolEdit, rxCurrEdit;

type
  TFrmAliquota = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    BtnGravar: TButton;
    BtnCancelar: TButton;
    EdtAliq: TCurrencyEdit;
    Label1: TLabel;
    Memo: TMemo;
    BtnLe: TButton;
    BtnMenuFiscal: TButton;
    RdgICMS: TRadioButton;
    RdgISS: TRadioButton;
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnLeClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnMenuFiscalClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAliquota: TFrmAliquota;

implementation
Uses UECF, UDM, UMenuFiscal;

{$R *.dfm}

procedure TFrmAliquota.BtnCancelarClick(Sender: TObject);
begin
   close;
end;

procedure TFrmAliquota.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:= caFree;
   Self := nil;
end;

procedure TFrmAliquota.FormCreate(Sender: TObject);
begin
  dm.ScaleForm( Self, False );
end;

procedure TFrmAliquota.BtnGravarClick(Sender: TObject);
begin
   if RdgICMS.Checked then
      ProgramaAliquota(iECF, 0, strtocurr(EdtAliq.Text))
   else
      if RdgISS.Checked then
         ProgramaAliquota(iECF, 1, strtocurr(EdtAliq.Text));
end;

procedure TFrmAliquota.BtnLeClick(Sender: TObject);
var sAuxAliq : string;
    i: integer;
begin
   Memo.Lines.Clear;
   i:= 1;
   sAuxAliq:= LeAliquotas(iECF);
   Memo.Text := sAuxAliq;
end;

procedure TFrmAliquota.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then
      close;
end;

procedure TFrmAliquota.BtnMenuFiscalClick(Sender: TObject);
begin
   Application.CreateForm(TFrmMenuFiscal, FrmMenuFiscal);
   FrmMenuFiscal.showmodal;
end;

end.
