unit UDeletaOS;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, ExtCtrls, StdCtrls, UNovosComponentes, UNovoFormulario;

type
  TfrmDeletaOS = class(UNovoFormulario.TForm)
    Panel1: TPanel;
    Panel5: TPanel;
    Label1: TLabel;
    senha: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    senhaex: string;
  end;

var
  frmDeletaOS: TfrmDeletaOS;

implementation

uses UNovoPrincipal;

{$R *.dfm}

procedure TfrmDeletaOS.Button1Click(Sender: TObject);
begin 
   senhaex := senha.Text;
   close;
end;

procedure TfrmDeletaOS.Button2Click(Sender: TObject);
begin 
   senhaex := '';
   close;
end;

procedure TfrmDeletaOS.FormShow(Sender: TObject);
begin 
   Senhaex := '';
   Senha.Clear;
   Senha.SetFocus;
end;

end.
