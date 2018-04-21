unit UDesativarProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, DB, UNovosComponentes, 
  UNovoFormulario, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, 
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, 
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.ScriptCommands, 
  FireDAC.Stan.Util, FireDAC.Comp.Client, FireDAC.Comp.Script, 
  FireDAC.Comp.DataSet;

type
  TFrmDesativarProdutos = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    SB: TStatusBar;
    Label1: TLabel;
    EdtData: TDateTimePicker;
    BtnOK: TBitBtn;
    BtnSair: TBitBtn;
    IBSPDesativa: TFDStoredProc;
    CheckEstoqueZerado: TCheckBox;
    procedure BtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOKClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDesativarProdutos: TFrmDesativarProdutos;

implementation
uses
  Udm, UNovoPrincipal;

{$R *.dfm}

procedure TFrmDesativarProdutos.BtnSairClick(Sender: TObject);
begin 
    close;
end;

procedure TFrmDesativarProdutos.FormShow(Sender: TObject);
begin 
   edtdata.Date:= date;
   sb.SimpleText:= '';
   edtdata.SetFocus;
end;

procedure TFrmDesativarProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmDesativarProdutos.BtnOKClick(Sender: TObject);
begin 
   sb.SimpleText:= 'Aguarde ...';
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   with IBSPDesativa do
      begin 
         close;
         Parambyname('dataini').AsDate:= edtdata.Date;
         ExecProc;
      end;
   dm.IBTransaction.Commit;
   IBSPDesativa.Close;
   sb.SimpleText:= 'Concluído';
end;

procedure TFrmDesativarProdutos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

end.
