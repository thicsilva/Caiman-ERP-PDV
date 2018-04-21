unit UDivide;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sLabel, Mask, RxToolEdit, RxCurrEdit;

type
  TfrmDivide = class(TForm)
    edtNumPessoas: TCurrencyEdit;
    sLabelFX1: TsLabelFX;
    edtTotal: TCurrencyEdit;
    sLabelFX2: TsLabelFX;
    Label1: TLabel;
    sLabelFX3: TsLabelFX;
    edtRecebido: TCurrencyEdit;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure LimpaTotais;
    procedure edtNumPessoasKeyPress(Sender: TObject; var Key: Char);
    procedure edtRecebidoKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    NumPag: Integer;
  public
    { Public declarations }
    cTotal : Currency;
  end;

var
  frmDivide: TfrmDivide;

implementation

uses UVendasCaixa, UECF, UDM, UDialog, UTroco;

{$R *.dfm}

procedure TfrmDivide.edtNumPessoasKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      begin
         try
             Key := #0;
             edtNumPessoas.Enabled := False;
             edtTotal.Value := cTotal / edtNumPessoas.Value;
             edtRecebido.Enabled := True;
             edtRecebido.Value := 0;
             edtRecebido.SelectAll;
             edtRecebido.SetFocus;
             Label2.Caption := 'Pessoa 1';
         except
             LimpaTotais;
         end;
      end;
end;

procedure TfrmDivide.edtRecebidoKeyPress(Sender: TObject; var Key: Char);
var
  Troco: Currency;
begin
   if Key = #13 then
      begin
          if edtRecebido.Value < edtTotal.Value then
             begin
                KDialog( 'Valor menor do que o Total', 'Divisão', 'INFO' );
                edtRecebido.SelectAll;
                edtRecebido.SetFocus;
                Exit;
             end;
          Key := #0;
          PagamentoCupomFiscal(iECF, iCOOVenda, iCCFVenda,
          edtRecebido.Value, DM.BuscaIndiceForma( DM.BuscaFormaPagamento( 'DN' ) ),
          'DINHEIRO', 'N', DM.BuscaFormaPagamento( 'DN' ));
          Inc( NumPag );
          Troco := edtRecebido.Value - edtTotal.Value;
          if Troco > 0 then
              begin
                 Application.CreateForm( TfrmTroco, frmTroco );
                 frmTroco.Troco := Troco;
                 frmTroco.ShowModal;
                 frmTroco.Release;
                 frmTroco := nil;
              end;
           edtRecebido.Enabled := True;
           edtRecebido.Value := 0;
           edtRecebido.SelectAll;
           edtRecebido.SetFocus;
           Label2.Caption := 'Pessoa ' + IntToStr( NumPag + 1 );
           if NumPag = edtNumPessoas.Value then
              Close;
      end;
end;

procedure TfrmDivide.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action :=  caFree;
   Self := nil;
end;

procedure TfrmDivide.FormCreate(Sender: TObject);
begin
   Label2.Caption := '';
end;

procedure TfrmDivide.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case Key of
       VK_ESCAPE : Close;
       VK_F3: LimpaTotais;
    end;
end;

procedure TfrmDivide.FormShow(Sender: TObject);
begin
   NumPag := 0;
    LimpaTotais;
end;

procedure TfrmDivide.LimpaTotais;
begin
    if NumPag > 0 then
       begin
          KDialog( 'Iniciou Pagamentos', 'Divisão', 'INFO' );
          Exit;
       end;
    edtNumPessoas.Enabled := True;
    edtNumPessoas.Value := 1;
    edtTotal.Value := cTotal / edtNumPessoas.Value;
     edtNumPessoas.SelectAll;
     edtNumPessoas.SetFocus;

end;

end.
