unit UQuantidadePreco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RxToolEdit, RxCurrEdit, ExtCtrls, Buttons;

type
  TTipoQP = ( tPQ, tP, tQ );
  TfrmQuantidadePreco = class(TForm)
    pnlQuantidade: TPanel;
    EdtQuant: TCurrencyEdit;
    Label1: TLabel;
    pnlValor: TPanel;
    Label2: TLabel;
    EdtValorUnitario: TCurrencyEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    Tipo: TTipoQP;
    Valor: Double;
    Quantidade: Double;
  end;

var
  frmQuantidadePreco: TfrmQuantidadePreco;

implementation

uses UVendasCaixa;

{$R *.dfm}

procedure TfrmQuantidadePreco.BitBtn1Click(Sender: TObject);
begin
   Valor := EdtValorUnitario.Value;
   Quantidade := EdtQuant.Value;
   ModalResult := mrOk;
end;

procedure TfrmQuantidadePreco.BitBtn2Click(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure TfrmQuantidadePreco.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_ESCAPE then
      begin
         ModalResult := mrCancel;
      end;
end;

procedure TfrmQuantidadePreco.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      begin
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TfrmQuantidadePreco.FormShow(Sender: TObject);
begin
    EdtValorUnitario.Value := Valor;
    EdtValorUnitario.DisplayFormat := FrmVendasCaixa.EdtValorUnitario.DisplayFormat;
    EdtValorUnitario.DecimalPlaces := FrmVendasCaixa.EdtValorUnitario.DecimalPlaces;
    EdtQuant.DisplayFormat:= FrmVendasCaixa.EdtQuant.DisplayFormat;
    EdtQuant.DecimalPlaces:= FrmVendasCaixa.EdtQuant.DecimalPlaces;
    EdtQuant.Value := Quantidade;
    case Tipo of
      tPQ: begin
              pnlQuantidade.Visible := True;
              pnlValor.Visible := true;
              EdtQuant.SetFocus;
              EdtQuant.SelectAll;
           end;
      tP:  begin
              pnlQuantidade.Visible := false;
              pnlValor.Visible := true;
              EdtValorUnitario.SetFocus;
              EdtValorUnitario.SelectAll;
           end;
      tQ: begin
              pnlQuantidade.Visible := True;
              pnlValor.Visible := false;
              EdtQuant.SetFocus;
              EdtQuant.SelectAll;
          end;
    end;


end;

end.
