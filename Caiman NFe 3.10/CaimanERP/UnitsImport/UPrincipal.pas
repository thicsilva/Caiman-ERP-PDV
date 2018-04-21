unit UPrincipal;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, acPNG, ExtCtrls, sScrollBox, sFrameBar, sSkinManager, sSkinProvider,
  ImgList, acAlphaImageList, UNovoFormulario, System.ImageList;

type
  TPrincipalXML = class(UNovoFormulario.TForm)
    sFrameLookBar1: TsFrameBar;
    Imagens: TsAlphaImageList;
    Panel1: TPanel;
    Image1: TImage;
    procedure sFrameLookBar1Items0CreateFrame(Sender: TObject;
      var Frame: TCustomFrame);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sFrameLookBar1Items1CreateFrame(Sender: TObject;
      var Frame: TCustomFrame);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrincipalXML: TPrincipalXML;

implementation

uses UFrameComXML, UsemXML, UNovoPrincipal;

{$R *.dfm}

procedure TPrincipalXML.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FreeAndNil( PrincipalXML );
end;

procedure TPrincipalXML.sFrameLookBar1Items0CreateFrame(Sender: TObject;
  var Frame: TCustomFrame);
begin 
   frame := TTFrameComXML.Create( nil );
   TTFrameComXML( Frame).CaminhoArquivo.Text := 'Selecione o Caminho do Arquivo';
end;

procedure TPrincipalXML.sFrameLookBar1Items1CreateFrame(Sender: TObject;
  var Frame: TCustomFrame);
begin 
   frame := TFrameSemXML.Create( nil );
   TFrameSemXML( Frame).edtChave.Text := 'Digite a Chave Aqui';
end;

end.
