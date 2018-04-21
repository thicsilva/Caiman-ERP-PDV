unit UPopUp;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms,
  Dialogs, acPNG, ExtCtrls, StdCtrls, sLabel, Buttons, UNovosComponentes, UNovoFormulario;

type
  TPopup = class(UNovoFormulario.TForm)
    Image1: TImage;
    Tit: TsLabelFX;
    Timer1: TTimer;
    Men: TsLabelFX;
    Image2: TImage;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MenClick(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Titulo: String;
    Mensagen: String;
    Financeiro: Boolean;
  end;

var
  Popup: TPopup;

implementation

uses UResumo, UNovoPrincipal;

{$R *.dfm}

procedure TPopup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TPopup.FormShow(Sender: TObject);
begin
   Tit.Caption := Titulo;
   Men.Caption := Mensagen;
   Timer1.Enabled := True;
end;

procedure TPopup.Image2Click(Sender: TObject);
begin
   Close;
end;

procedure TPopup.MenClick(Sender: TObject);
begin
   if Financeiro then
      begin
        hide;
        Application.CreateForm( TfrmResumo, frmResumo);
        frmResumo.ShowModal;
      end;
end;

procedure TPopup.Timer1Timer(Sender: TObject);
begin
   Close;
end;

end.


