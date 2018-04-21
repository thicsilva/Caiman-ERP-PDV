unit UFRMRELATORIO;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, UNovosComponentes, UNovoFormulario;

type
  TFrmRelatorio = class(UNovoFormulario.TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    Rdg: TRadioGroup;
    StatusBar1: TStatusBar;
    BtnVis: TButton;
    BtnImp: TButton;
    BtnSair: TButton;
    procedure BtnsairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelatorio: TFrmRelatorio;

implementation

uses UNovoPrincipal;

{$R *.dfm}

procedure TFrmRelatorio.BtnsairClick(Sender: TObject);
begin 
   close;
end;

procedure TFrmRelatorio.FormShow(Sender: TObject);
begin 
   Rdg.ItemIndex:= 0;
end;

procedure TFrmRelatorio.FormCreate(Sender: TObject);
begin 
   
end;

procedure TFrmRelatorio.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
   if key = vk_escape then
      close;
end;

end.
