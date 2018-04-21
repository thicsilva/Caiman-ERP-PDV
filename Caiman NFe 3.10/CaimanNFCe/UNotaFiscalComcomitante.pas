unit UNotaFiscalComcomitante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmNotaFiscalComcomitante = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    edtNumNota: TEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtNumNotaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNotaFiscalComcomitante: TfrmNotaFiscalComcomitante;

implementation

uses UVendasCaixa;

{$R *.dfm}

procedure TfrmNotaFiscalComcomitante.BitBtn1Click(Sender: TObject);
begin
   if edtNumNota.Text = '' then
       Exit;
   FrmVendasCaixa.NumeroNF := StrToInt( edtNumNota.Text );
   Close;
end;

procedure TfrmNotaFiscalComcomitante.BitBtn2Click(Sender: TObject);
begin
   FrmVendasCaixa.NumeroNF := 0;
   Close;
end;

procedure TfrmNotaFiscalComcomitante.edtNumNotaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not CharInSet( Key, ['0'..'9']) then
       begin
          Key := #0;
       end;
end;

procedure TfrmNotaFiscalComcomitante.FormShow(Sender: TObject);
begin
   edtNumNota.Text := '';
end;

end.
