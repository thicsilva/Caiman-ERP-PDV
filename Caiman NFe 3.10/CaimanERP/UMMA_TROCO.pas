unit UMMA_TROCO;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, ExtCtrls, StdCtrls, Mask, rxToolEdit, rxCurrEdit, acPNG, UNovosComponentes, UNovoFormulario;

type
  TfrmMMA_TROCO = class(UNovoFormulario.TForm)
    Image4: TImage;
    Label1: TLabel;
    valor_pagar: TPanel;
    dinheiro: TCurrencyEdit;
    Label2: TLabel;
    Label3: TLabel;
    troco: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dinheiroKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    valor: double;
  end;

var
  frmMMA_TROCO: TfrmMMA_TROCO;

implementation

uses UNovoPrincipal;

{$R *.dfm}

procedure TfrmMMA_TROCO.dinheiroKeyPress(Sender: TObject; var Key: Char);
var
  Calc: double;
begin 
  if Key = #13 then
  begin 
    Key := #0;
    Calc := dinheiro.Value - valor;
    troco.Caption := formatFloat('R$ 0.00', Calc);
  end;
end;

procedure TfrmMMA_TROCO.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
  Action := cafree;
end;

procedure TfrmMMA_TROCO.FormShow(Sender: TObject);
begin 
  valor_pagar.Caption := formatFloat('R$ 0.00', valor);
  dinheiro.SetFocus;
end;

end.
