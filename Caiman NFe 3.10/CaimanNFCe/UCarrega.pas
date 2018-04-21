unit UCarrega;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, acPNG, ExtCtrls, StdCtrls, sLabel, jpeg;

type
  TfrmCarrega = class(TForm)
    Image1: TImage;
    Men: TsLabelFX;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCarrega: TfrmCarrega;

implementation

uses UDM;

{$R *.dfm}

procedure TfrmCarrega.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FreeAndNil(  frmCarrega );
end;

procedure TfrmCarrega.FormCreate(Sender: TObject);
begin
   dm.ScaleForm( Self, False );
end;

procedure TfrmCarrega.FormShow(Sender: TObject);
begin

  if PUsuario <> '' then
        ShowWindow(Application.Handle, SW_HIDE);   //Brush.Style := bsClear;
   DM.CriaImg;
   dm.CarregaImagem2( dm.FundoCarrega, dm.ImgTempCia );
   Image1.Picture.Bitmap.Assign( DM.ImgTempCia );
   DM.DestroyImg;

end;

end.
