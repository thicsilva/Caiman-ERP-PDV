unit USelVend;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Buttons, StdCtrls, Mask, RzEdit, ComCtrls, UVendasCaixa, 
  sSpeedButton;

type
  TfrmSelVend = class(TForm)
    cod_vend: TRzNumericEdit;
    BtnConsVend: TsSpeedButton;
    vend: TEdit;
    StatusBar1: TStatusBar;
    Button1: TButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure cod_vendExit(Sender: TObject);
    procedure BtnConsVendClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cod_vendi: integer;
  end;

var
  frmSelVend: TfrmSelVend;

implementation

uses
  UDM, UConsVend, UMenuFiscal;

{$R *.dfm}

procedure TfrmSelVend.BtnConsVendClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsVend, FrmConsVend);
  FrmConsVend.tag:= 6;
  FrmConsVend.showmodal;
end;

procedure TfrmSelVend.Button1Click(Sender: TObject);
begin
   iCodvend := StrToInt(cod_vend.Text);
   close;
end;

procedure TfrmSelVend.cod_vendExit(Sender: TObject);
begin
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   dm.QConsulta.Close;
   dm.QConsulta.SQL.Text := 'select * from vendedor where COD_VEND=' + cod_vend.Text;
   dm.QConsulta.Open;
   if dm.QConsulta.IsEmpty then
      begin
         ShowMessage( 'Vendedor não cadastrado' );
         dm.QConsulta.Close;
         dm.IBTransaction.Commit;
         cod_vend.Value := 0;
         vend.Text := '';
         exit;
      end;

   vend.Text := dm.QConsulta.FieldByName( 'NOME_VEND' ).AsString;
   dm.QConsulta.Close;
   dm.IBTransaction.Commit;


end;

procedure TfrmSelVend.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmSelVend.FormCreate(Sender: TObject);
begin
  dm.ScaleForm( Self, False );
end;

procedure TfrmSelVend.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = VK_ESCAPE then
      begin
         iCodVend := Cod_vendi;
         close;
      end;
   if (ssAlt in Shift) and (chr(Key) in ['M', 'm']) then
      begin
         if (iCodPreVenda = 0) and (iCodOrcamento = 0) and (iCodOrdemServico = 0) and (iCodigoVenda = 0) and (iCodContaCliente = 0) then
            begin
               Application.CreateForm(TFrmMenuFiscal, FrmMenuFiscal);
               FrmMenuFiscal.showmodal;
            end;
      end;
end;

procedure TfrmSelVend.FormShow(Sender: TObject);
begin

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   dm.QConsulta.Close;
   dm.QConsulta.SQL.Text := 'select * from vendedor where COD_VEND=' + inttostr(cod_vendi);
   dm.QConsulta.Open;
   cod_vend.Value := cod_vendi;
   vend.Text := dm.QConsulta.FieldByName( 'NOME_VEND' ).AsString;
   dm.QConsulta.Close;
   dm.IBTransaction.Commit;
   cod_vend.SetFocus;   

end;

end.

