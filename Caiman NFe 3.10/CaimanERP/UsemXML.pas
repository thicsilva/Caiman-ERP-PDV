unit UsemXML;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Buttons, StdCtrls, sLabel, UNovosComponentes, UNovoFormulario, 
  sSpeedButton;

type
  TFrameSemXML = class(TFrame)
    edtChave: TEdit;
    sLabelFX1: TsLabelFX;
    GerarButton1: TsSpeedButton;
    procedure GerarButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  uBuscaXml, UPrincipal;

{$R *.dfm}

procedure TFrameSemXML.GerarButton1Click(Sender: TObject);
begin
   Application.CreateForm( TfrmBuscarXML, frmBuscarXML );
   frmBuscarXML.edtChaveNFe.Text := edtChave.Text;
   frmBuscarXml.show;
   PrincipalXML.Close;
end;

end.

