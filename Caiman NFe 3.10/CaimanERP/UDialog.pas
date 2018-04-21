unit UDialog;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, acPNG, ExtCtrls, StdCtrls, Buttons, sBitBtn, sLabel, Vcl.ImgList,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore,
  dxSkinMetropolis, cxButtons, cxControls, cxContainer, cxEdit, cxLabel,
  System.StrUtils, System.ImageList;

type
  TfrmDialogTipo = ( tdtPergunta, tdtErro, tdtInfo );
  TfrmDialog = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    il1: TImageList;
    Panel3: TPanel;
    pnlMessage: TPanel;
    imgIco: TImage;
    btnConfirmar: TcxButton;
    btnCancelar: TcxButton;
    lblMen: TcxLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    FXMin: Integer;
    FYMin: Integer;
    FXLMin: Integer;
    FYLMin: Integer;
  public
    { Public declarations }
    ICONE: TfrmDialogTipo;
  end;
  function KDialog( Texto: String; const Titulo: String = ''; const Icone: TfrmDialogTipo = tdtInfo ): Boolean;


implementation

{$R *.dfm}

function KDialog( Texto: String; const Titulo: String = ''; const Icone: TfrmDialogTipo = tdtInfo ): Boolean;
var
   Icone2, Titulo2: String;
   frmDialog: TfrmDialog;
begin
   Titulo2 := Titulo;
   frmDialog := TfrmDialog.Create( nil );
   try
       frmDialog.lblMen.Caption := Texto;
       frmDialog.Caption := Titulo2;
       frmDialog.ICONE := Icone;
       Result := frmDialog.ShowModal = mrYes;
   finally
        frmDialog.Free;
   end;
end;


procedure TfrmDialog.btnCancelarClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure TfrmDialog.btnConfirmarClick(Sender: TObject);
begin
    ModalResult := mrYes;
end;

procedure TfrmDialog.FormCreate(Sender: TObject);
begin
   FXMin := Width;
   FYMin := Height;
   FXLMin := lblMen.Width;
   FYLMin := lblMen.Height;
end;

procedure TfrmDialog.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
       VK_RETURN: ModalResult := mrYes;
       VK_ESCAPE: ModalResult := mrCancel;
   end;
end;

procedure TfrmDialog.FormShow(Sender: TObject);
begin
   if FXLMin < lblMen.Width then
      Width := FXMin + ( lblMen.Width - FXLMin );
   if FYLMin < lblMen.Height then
      Height := FYMin + ( lblMen.Height - FYLMin );
   il1.Draw( imgIco.Canvas, 0, 0, Ord( ICONE ), TDrawingStyle.dsTransparent, TImageType.itImage, True );
   btnCancelar.Visible := ICONE in [ tdtPergunta ];
   btnConfirmar.Caption := '(Enter)' + sLineBreak + IfThen( ICONE in [tdtErro, tdtInfo ],
    'Sair', 'Confirmar' );
end;

end.
