unit uMenTEF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, acPNG, ExtCtrls, sLabel, jpeg;

type
  TfrmMenTef = class(TForm)
    lMensagemCliente: TsLabelFX;
    Image2: TImage;
    bCancelarResp: TBitBtn;
    lMensagemOperador: TsLabelFX;
    subMen: TsLabelFX;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenTef: TfrmMenTef;

implementation

uses UFechaVenda, UDM;

{$R *.dfm}

procedure TfrmMenTef.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FreeAndNil( frmMenTef );
end;

procedure TfrmMenTef.FormCreate(Sender: TObject);
begin
   dm.ScaleForm( Self, False );
end;

procedure TfrmMenTef.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_ESCAPE then
      begin
         FrmFechaVenda.fCancelado := True;
      end;
end;

procedure TfrmMenTef.FormShow(Sender: TObject);
begin
   //Brush.Style := bsClear;
   DM.CriaImg;
   dm.CarregaImagem2( dm.FundoMenTef, dm.ImgTempCia );
   Image2.Picture.Bitmap.Assign( DM.ImgTempCia );
   DM.DestroyImg;



end;

end.
