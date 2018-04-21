unit USobre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, StdCtrls, jpeg, RxGIF, pngimage, RzPanel, acPNG, 
  UNovosComponentes, UNovoFormulario;

type
  TFrmSobre = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Label5: TLabel;
    RzPanel1: TRzPanel;
    Label1: TLabel;
    LSistema: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Lbanco: TLabel;
    Image1: TImage;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSobre: TFrmSobre;

implementation
uses
  UDM, Ubibli1, UNovoPrincipal;

{$R *.dfm}

procedure TFrmSobre.FormClose(Sender: TObject; var Action: TCloseAction);
begin 
   Action:= caFree;
end;

procedure TFrmSobre.FormShow(Sender: TObject);
begin 
   if dm.IBTransaction.Active then
      dm.IBTransaction.Commit;
   dm.IBTransaction.StartTransaction;
   try
     try
       with dm.Consulta do
          begin 
             close;
             sql.clear;
             sql.add('SELECT * from SP_VERSION');
             ExecOrOpen;
             LBanco.caption:= 'Versão do Banco ' +
                Copy( fieldbyname('VERSION').AsString, 1, 1 ) + '.' +
                Copy( fieldbyname('VERSION').AsString, 2, 1 ) + '.' +
                Copy( fieldbyname('VERSION').AsString, 3, 1 );
             LSistema.Caption := 'Versão do sistema ' +VersaoExe( Application.ExeName) ;
          end;
       dm.IBTransaction.Commit;
     except
       dm.IBTransaction.Rollback;
     end;
   finally
     dm.Consulta.close;
   end;
end;

procedure TFrmSobre.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

end.
