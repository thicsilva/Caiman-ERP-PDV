unit UImei;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmIMEI = class(TForm)
    edtImei: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIMEI: TfrmIMEI;

implementation

uses UVendasCaixa;

{$R *.dfm}

procedure TfrmIMEI.BitBtn1Click(Sender: TObject);
begin
   if edtImei.Text = '' then
      exit;
   FrmVendasCaixa.IMEIPRod := edtImei.Text;
   ModalResult := mrOk;
   Close;
end;

procedure TfrmIMEI.BitBtn2Click(Sender: TObject);
begin
   FrmVendasCaixa.ProdutoComIMei := False;
   FrmVendasCaixa.IMEIPRod := '';
   ModalResult := mrCancel;
   Close;
end;

procedure TfrmIMEI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmIMEI.FormShow(Sender: TObject);
begin
   edtImei.Clear;
end;

end.
