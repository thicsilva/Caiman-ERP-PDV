unit ULiberaSistema;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, UNovosComponentes, 
  UNovoFormulario;

type
  TFrmLiberaSistema = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Label1: TLabel;
    EdtData: TDateTimePicker;
    BtnOK: TBitBtn;
    BtnSair: TBitBtn;
    StatusBar1: TStatusBar;
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLiberaSistema: TFrmLiberaSistema;

implementation
uses
  Udm, DB, UNovoPrincipal;

{$R *.dfm}

procedure TFrmLiberaSistema.BtnSairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmLiberaSistema.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

procedure TFrmLiberaSistema.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmLiberaSistema.FormShow(Sender: TObject);
begin 
   {busca a data nos parametros}
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.QConsulta do
          begin 
             close;
             sql.Clear;
             sql.add('SELECT DATA_LIBERACAO ' +
                     'FROM PARAMETROS ' +
                     'WHERE COD_EMP = 1');
             Open;
             if fieldbyname('data_liberacao').IsNull then
                EdtData.Date:= strtodate('31/12/2010')
             else
                EdtData.Date:= fieldbyname('data_liberacao').AsDateTime;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao buscar os dados');
     end;
   finally
     dm.QConsulta.Close;
   end;
end;

procedure TFrmLiberaSistema.BtnOKClick(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.Consulta do
          begin 
             close;
             sql.Clear;
             sql.add('UPDATE PARAMETROS SET DATA_LIBERACAO = :DATA');
             Parambyname('data').AsDate:= EdtData.Date;
             ExecOrOpen;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
       AlertaCad('Erro ao gravar');
     end;
   finally
     dm.Consulta.Close;
     FrmLiberaSistema.Close;
   end;
end;

procedure TFrmLiberaSistema.FormKeyPress(Sender: TObject; var Key: Char);
begin 
   if Key = #13 then
      begin 
         Key := #0;
         SelectNext(ActiveControl, True, True);
      end;
end;

end.
