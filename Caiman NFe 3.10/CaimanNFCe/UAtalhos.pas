unit UAtalhos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, acPNG;

type
  TfrmAtalhos = class(TForm)
    Image1: TImage;
    Label35: TLabel;
    Label12: TLabel;
    Label36: TLabel;
    Label11: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label13: TLabel;
    Label10: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label19: TLabel;
    Label16: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Image2: TImage;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAtalhos: TfrmAtalhos;

implementation

{$R *.dfm}

procedure TfrmAtalhos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = vk_escape then
      begin
        close;
      end;
end;

procedure TfrmAtalhos.FormShow(Sender: TObject);
begin
   frmAtalhos.Brush.Style := bsClear;
end;

end.
