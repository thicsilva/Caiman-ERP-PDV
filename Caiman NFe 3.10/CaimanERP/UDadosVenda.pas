unit UDadosVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Mask, DB, rxToolEdit, rxCurrEdit, 
  UNovosComponentes, UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, 
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, 
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, 
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmDadosVenda = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    BtnSair: TButton;
    Label1: TLabel;
    EdtAutorizado: TEdit;
    Label2: TLabel;
    EdtDesc: TCurrencyEdit;
    Label3: TLabel;
    EdtAcres: TCurrencyEdit;
    QDadosVendas: TFDQuery;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDadosVenda: TFrmDadosVenda;

implementation
uses
  Udm, UContasRecRec, UNovoPrincipal;

{$R *.dfm}

procedure TFrmDadosVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmDadosVenda.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmDadosVenda.FormShow(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with QDadosVendas do
          begin 
             close;
             if FrmDadosVenda.Tag = 0 then
                Parambyname('codven').AsInteger:= FrmContasRecRec.QConsARecCOD_VENDA.AsInteger
             else
                Parambyname('codven').AsInteger:= FrmContasRecRec.QConsRecCOD_VENDA.AsInteger;
             open;
             EdtAutorizado.text:= fieldbyname('desc_pessoa_autorizada').AsString;
             EdtDesc.Text      := fieldbyname('desconto_ven').AsString;
             EdtAcres.Text     := fieldbyname('acrescimo_ven').AsString;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar os dados da venda');
     end;
   finally
     QDadosVendas.Close;
   end;
end;

procedure TFrmDadosVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   QDadosVendas.Close;
   Action:= caFree;
end;

end.
