unit UMenuBalcao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sLabel, acPNG, ExtCtrls, Buttons, sSpeedButton;

type
  TfrmMenuBalcao = class(TForm)
    Image1: TImage;
    Image3: TImage;
    sLabelFX1: TsLabelFX;
    Image2: TImage;
    Image8: TImage;
    Label1: TLabel;
    Image4: TImage;
    sLabelFX2: TsLabelFX;
    sSpeedButton1: TsSpeedButton;
    sSpeedButton2: TsSpeedButton;
    sSpeedButton3: TsSpeedButton;
    sSpeedButton4: TsSpeedButton;
    procedure Image8Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenuBalcao: TfrmMenuBalcao;

implementation

{$R *.dfm}

procedure TfrmMenuBalcao.FormShow(Sender: TObject);
begin
   Brush.Style := bsClear;
end;

procedure TfrmMenuBalcao.Image8Click(Sender: TObject);
begin
   Application.Terminate;
end;

end.
