unit UselIntervaloProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Mask, sMaskEdit, sCustomComboEdit, sTooledit, 
  AdvGlowButton, UNovosComponentes, UNovoFormulario;

type
  TSelIntervaloProduto = class(UNovoFormulario.TForm)
    Label1: TLabel;
    Ini: TsDateEdit;
    Fim: TsDateEdit;
    Label2: TLabel;
    AdvGlowButton7: TAdvGlowButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure AdvGlowButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    COD: Integer;
    Nome: String;
  end;

var
  SelIntervaloProduto: TSelIntervaloProduto;

implementation

uses
  UTRelProdutoCliente, UDM, UNovoPrincipal;

{$R *.dfm}

procedure TSelIntervaloProduto.AdvGlowButton7Click(Sender: TObject);
begin 
   Application.CreateForm( TfrmRelProdutoCliente, frmRelProdutoCliente );
   if DM.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   frmRelProdutoCliente.QCliente.ParamByName( 'CODCLI' ).AsInteger := COD;
   frmRelProdutoCliente.QCliente.ParamByName( 'DATA_INI' ).AsDate := Ini.Date;
   frmRelProdutoCliente.QCliente.ParamByName( 'DATA_FIN' ).AsDate := Fim.Date;
   frmRelProdutoCliente.QTotal.ParamByName( 'CODCLI' ).AsInteger := COD;
   frmRelProdutoCliente.QTotal.ParamByName( 'DATA_INI' ).AsDate := Ini.Date;
   frmRelProdutoCliente.QTotal.ParamByName( 'DATA_FIN' ).AsDate := Fim.Date;
   frmRelProdutoCliente.QCliente.Open;
   frmRelProdutoCliente.QTotal.Open;
   frmRelProdutoCliente.Cliente.Caption := Nome;
   frmRelProdutoCliente.IntervaloVendas.Caption := 'de ' + ini.Text + ' à ' + fim.Text;
   frmRelProdutoCliente.QuickRep1.PreviewModal;
   dm.IBTransaction.Commit;
   FreeAndNil(  frmRelProdutoCliente );
   Close;

end;

procedure TSelIntervaloProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   FreeAndNil( SelIntervaloProduto );
end;

procedure TSelIntervaloProduto.FormShow(Sender: TObject);
begin 
   Ini.Date := date;
   Fim.Date := date;
end;

end.
