unit UTEFDiscado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, acPNG, sLabel;

type
  TfrmTEFDiscado = class(TForm)
    Image1: TImage;
    Men: TsLabelFX;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTEFDiscado: TfrmTEFDiscado;

implementation

{$R *.dfm}

procedure TfrmTEFDiscado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FreeAndNil( frmTefDiscado );
end;

procedure TfrmTEFDiscado.FormShow(Sender: TObject);
begin
   Brush.Style := bsClear;
end;

end.
