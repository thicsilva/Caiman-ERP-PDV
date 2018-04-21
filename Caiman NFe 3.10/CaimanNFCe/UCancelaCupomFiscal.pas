unit UCancelaCupomFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type
  TFrmCancelaCupomFiscal = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Label1: TLabel;
    EdtCOO: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure EdtCOOKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCancelaCupomFiscal: TFrmCancelaCupomFiscal;

implementation
Uses UECF, UDM, UMenuFiscal;

{$R *.dfm}

procedure TFrmCancelaCupomFiscal.EdtCOOKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (key in ['0'..'9', #13, #8]) then
      key := #0;
end;

procedure TFrmCancelaCupomFiscal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:= caFree;
   Self := nil;
end;

procedure TFrmCancelaCupomFiscal.FormCreate(Sender: TObject);
begin
  dm.ScaleForm( Self, False );
end;

procedure TFrmCancelaCupomFiscal.Button2Click(Sender: TObject);
begin
   close;
end;

procedure TFrmCancelaCupomFiscal.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = vk_escape then
      close;
   if key = vk_f10 then
      begin
         Application.CreateForm(TFrmMenuFiscal, FrmMenuFiscal);
         FrmMenuFiscal.showmodal;
      end;
end;

procedure TFrmCancelaCupomFiscal.FormShow(Sender: TObject);
begin
   EdtCOO.Text := NumeroCupom( iECF );
end;

procedure TFrmCancelaCupomFiscal.Button1Click(Sender: TObject);
var iUltimoCOOECF : integer;
begin
   if trim(EdtCOO.Text) = '' then
      begin
         showmessage('Digite o COO do Cupom Fiscal');
         EdtCOO.SetFocus;
         exit;
      end;

   if iECF = 1 then
      iUltimoCOOECF:= strtoint(NumeroCupom(iECF))
   else
      iUltimoCOOECF:= strtoint(NumeroCupom(iECF)) - 1;

   if iUltimoCOOECF = strtoint(EdtCOO.Text) then
      begin
         if Application.MessageBox(pchar('Confirma o Cancelamento do Cupom: ' + inttostr(iUltimoCOOECF) + ' ?') , 'Cancelamento de Cupom Fiscal', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) = 6 then
            begin
               if CancelaCupomFiscal(iECF) = 0 then
                  dm.CancelaVenda(iUltimoCOOECF);
            end;
      end
   else
      begin
         showmessage('Cupom Fiscal não pode ser cancelado');
         close;
      end;
end;

end.
