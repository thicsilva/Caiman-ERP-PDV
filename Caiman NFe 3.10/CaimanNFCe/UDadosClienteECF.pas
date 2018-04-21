unit UDadosClienteECF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons, DB, FireDAC.Stan.Intf, 
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, 
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, 
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Client, 
  FireDAC.Comp.Script, FireDAC.Comp.DataSet;

type
  TFrmDadosClienteECF = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    EdtNome: TEdit;
    Label2: TLabel;
    EdtEnd: TEdit;
    Label3: TLabel;
    EdtCNPJ: TEdit;
    BtnSair: TBitBtn;
    QCliente: TFDQuery;
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDadosClienteECF: TFrmDadosClienteECF;

implementation
uses
  Udm, Ubibli1, UVendasCaixa, UFechaVenda;

{$R *.dfm}

procedure TFrmDadosClienteECF.BtnSairClick(Sender: TObject);
begin
   BtnSair.Enabled:= false;

   if trim(EdtCNPJ.Text) <> '' then
      begin
         if not ((cpf(RetiraCaracter(EdtCNPJ.Text))) or (cnpj(RetiraCaracter(EdtCNPJ.Text)))) then
            begin
               showmessage('CPF/CNPJ inválido');
               EdtCNPJ.SetFocus;
               BtnSair.Enabled:= true;
               exit;
            end;
      end;

   sNomeCliente := trim(EdtNome.Text);
   sEndCliente  := trim(EdtEnd.Text);
   sDocCliente  := trim(EdtCNPJ.Text);
   FrmDadosClienteECF.close;
end;

procedure TFrmDadosClienteECF.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      begin
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

procedure TFrmDadosClienteECF.FormShow(Sender: TObject);
var iClientePadrao : integer;
begin

   BtnSair.Enabled:= true;
   edtnome.Clear;
   edtend.Clear;
   EdtCNPJ.Clear;

   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with QCliente do
          begin
             close;
             Parambyname('cod').AsInteger:= iCodCliente;
             open;

             EdtNome.Text := fieldbyname('nome_cli').AsString;
             EdtEnd.Text  := fieldbyname('endres_cli').AsString + ' - ' + fieldbyname('cidres_cli').AsString + '- ' + fieldbyname('estres_cli').AsString;
             EdtCNPJ.Text := fieldbyname('cnpj_cli').AsString;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       showmessage('Erro ao buscar os dados do cliente');
     end;
   finally
     QCliente.Close;
   end;
end;

procedure TFrmDadosClienteECF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:= caFree;
   Self := nil;
end;

procedure TFrmDadosClienteECF.FormCreate(Sender: TObject);
begin
  dm.ScaleForm( Self, False );
end;

end.
