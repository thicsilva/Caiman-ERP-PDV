unit Unit4;

{$IFDEF FPC}
 {$mode objfpc}{$H+}
{$ENDIF}

interface

uses
  Classes, SysUtils,
  Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, Buttons, acPNG, sLabel,
  jpeg;

type

{$IFNDEF FPC}
 {$R *.dfm}
{$ELSE}
 {$R *.lfm}
{$ENDIF}

  { TForm4 }

  TForm4 = class(TForm)
     ListBox1 : TListBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Image1: TImage;
    Titulo: TsLabelFX;
    Memo1: TMemo;
     procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form4 : TForm4; 

implementation

uses UDM;

{ TForm4 }

procedure TForm4.FormCreate(Sender: TObject);
begin
   dm.ScaleForm( Self, False );
end;

procedure TForm4.FormShow(Sender: TObject);
begin
 //  Brush.Style := bsclear;
   if Memo1.Lines.Count > 0 then
   begin
 //    Memo1.Width   := Trunc(Width/2)-10;
     Memo1.Visible := True ;
//     Splitter1.Visible := True ;
   end ;

   ListBox1.SetFocus;
   if ListBox1.Items.Count > 0 then
      ListBox1.ItemIndex := 0 ;
   ListBox1.Color := dm.BuscaCor( dm.FundoMenuTef, ListBox1.Left, ListBox1.Top );
   Memo1.Color := ListBox1.Color;
   DM.CriaImg;
   dm.CarregaImagem2( dm.FundoMenuTef, dm.ImgTempCia );
   Image1.Picture.Bitmap.Assign( DM.ImgTempCia );
   DM.DestroyImg;

end;

end.

