unit UParcelaPendente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, rxToolEdit, rxCurrEdit, 
  Mask, UNovosComponentes, UNovoFormulario;

type
  TFrmParcelaPendente = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    EdtEmissao: TMaskEdit;
    Label2: TLabel;
    EdtVenc: TMaskEdit;
    Label3: TLabel;
    EdtValor: TCurrencyEdit;
    BtnOK: TBitBtn;
    BtnCancelar: TBitBtn;
    procedure BtnCancelarClick(Sender: TObject);
    procedure EdtEmissaoExit(Sender: TObject);
    procedure EdtVencExit(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmParcelaPendente: TFrmParcelaPendente;

implementation
uses
  Udm, URecebimento, UNovoPrincipal;

{$R *.dfm}

procedure TFrmParcelaPendente.BtnCancelarClick(Sender: TObject);
begin 
   bGeraParcela:= false;
   close;
end;

procedure TFrmParcelaPendente.EdtEmissaoExit(Sender: TObject);
begin 
   if btncancelar.Focused then
      exit;
   try
     StrToDate(edtemissao.text);
   except
     AlertaCad('Data Inválida');
//     edtemissao.setfocus;
   end;
end;

procedure TFrmParcelaPendente.EdtVencExit(Sender: TObject);
begin 
   if btncancelar.Focused then
      exit;
   try
     StrToDate(edtvenc.text);
   except
     AlertaCad('Data Inválida');
//     edtvenc.setfocus;
   end;
end;

procedure TFrmParcelaPendente.BtnOKClick(Sender: TObject);
begin 
   if edtvalor.text = '0' then
      begin 
         AlertaCad('Digite o Valor da Parcela');
//         edtvalor.setfocus;
         exit;
      end;
   if strtodate(edtvenc.text) < strtodate(edtemissao.text) then
      begin 
         AlertaCad('A data de vencimento não pode ser menor que a data de emissão');
//         edtvenc.setfocus;
         exit;
      end;
   bGeraParcela:= true;
   close;
end;

procedure TFrmParcelaPendente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmParcelaPendente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmParcelaPendente.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

end.
