unit UDadosCheque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, rxToolEdit, rxCurrEdit, Mask, StdCtrls;

type
  TFrmDadosCheque = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    EdtCod: TEdit;
    EdtCodCli: TEdit;
    EdtNomeCli: TEdit;
    Label5: TLabel;
    Label2: TLabel;
    EdtCodBanco: TEdit;
    EdtNomeBanco: TEdit;
    Label6: TLabel;
    EdtAgencia: TEdit;
    EdtConta: TEdit;
    Label7: TLabel;
    EdtNumero: TEdit;
    Label8: TLabel;
    EdtDataEmi: TMaskEdit;
    Label10: TLabel;
    EdtDataVenc: TMaskEdit;
    Label11: TLabel;
    Label12: TLabel;
    EdtValor: TCurrencyEdit;
    Label9: TLabel;
    Label13: TLabel;
    EdtObs: TEdit;
    EdtEmitente: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDadosCheque: TFrmDadosCheque;

implementation

uses
  UDM;

{$R *.dfm}

procedure TFrmDadosCheque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:= caFree;
   Self := nil;
end;

procedure TFrmDadosCheque.FormCreate(Sender: TObject);
begin
  dm.ScaleForm( Self, False );
end;

procedure TFrmDadosCheque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = vk_escape then
      close;
end;

end.
