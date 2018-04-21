unit UProdutoNaoCadastrado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, UVendasCaixa;

type
  TFrmProdutoNaoCadastrado = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Timer1: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmProdutoNaoCadastrado: TFrmProdutoNaoCadastrado;

implementation

uses UMenuFiscal, UDM;

{$R *.dfm}

procedure TFrmProdutoNaoCadastrado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:= caFree;
   Self := nil;
end;

procedure TFrmProdutoNaoCadastrado.FormCreate(Sender: TObject);
begin
  dm.ScaleForm( Self, False );
end;

procedure TFrmProdutoNaoCadastrado.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if key = vk_escape then
      close;
   if (ssAlt in Shift) and (chr(Key) in ['M', 'm']) then
      begin
         if (iCodPreVenda = 0) and (iCodOrcamento = 0) and (iCodOrdemServico = 0) and (iCodigoVenda = 0) and (iCodContaCliente = 0) then
            begin
               Application.CreateForm(TFrmMenuFiscal, FrmMenuFiscal);
               FrmMenuFiscal.showmodal;
            end;
      end;
end;

procedure TFrmProdutoNaoCadastrado.Timer1Timer(Sender: TObject);
begin
   if panel1.Caption = 'PRODUTO NÃO CADASTRADO' then
      panel1.Caption:= ''
   else
      panel1.Caption:= 'PRODUTO NÃO CADASTRADO';
end;

procedure TFrmProdutoNaoCadastrado.FormShow(Sender: TObject);
begin

//   sndPlaySound('c:\comercio\produto.wav',SND_ASYNC);
end;

end.
