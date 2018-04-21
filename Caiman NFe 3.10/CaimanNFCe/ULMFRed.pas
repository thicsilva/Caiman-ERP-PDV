unit ULMFRed;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, StdCtrls;

type
  TFrmLMFRed = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    EdtRedIni: TEdit;
    Label2: TLabel;
    EdtRedFin: TEdit;
    BtnOk: TButton;
    BtnCancelar: TButton;
    BtnMenuFiscal: TButton;
    procedure FormShow(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
  FrmLMFRed: TFrmLMFRed;

implementation
uses
  UDM, UECF, UMenuFiscal;

{$R *.dfm}

procedure TFrmLMFRed.FormShow(Sender: TObject);
begin

   EdtRedIni.Clear;
   EdtRedFin.Clear;
   edtredini.SetFocus;
end;

procedure TFrmLMFRed.BtnOkClick(Sender: TObject);
var RedIni, RedFin : Word;
begin
   if (edtredini.Text = '') or (edtredfin.Text = '') then
      begin
         showmessage('Digite a Redução Inicial e a Final');
         edtredini.SetFocus;
         exit;
      end;
   if (strtoint(edtredfin.Text) < strtoint(edtredini.Text)) then
      begin
         showmessage('A redução final não pode ser menor que a inicial');
         exit;
      end;
   LeituraMFReducao( iECF, StrToInt( EdtRedIni.Text ), StrToInt( EdtRedIni.Text ), True );
end;

procedure TFrmLMFRed.BtnCancelarClick(Sender: TObject);
begin
   close;
end;

procedure TFrmLMFRed.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= cafree;
   Self := nil;
end;

procedure TFrmLMFRed.FormCreate(Sender: TObject);
begin
  dm.ScaleForm( Self, False );
end;

procedure TFrmLMFRed.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then
      close;
end;

procedure TFrmLMFRed.BtnMenuFiscalClick(Sender: TObject);
begin
   Application.CreateForm(TFrmMenuFiscal, FrmMenuFiscal);
   FrmMenuFiscal.showmodal;
end;

end.
