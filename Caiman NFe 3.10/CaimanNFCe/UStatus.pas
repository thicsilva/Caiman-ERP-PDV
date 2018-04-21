unit UStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sLabel, jpeg, ExtCtrls;

type
  TfrmStatus = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    lblStatus: TsLabelFX;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmStatus: TfrmStatus;

implementation

{$R *.dfm}

procedure TfrmStatus.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   Self := Nil;
end;

end.
