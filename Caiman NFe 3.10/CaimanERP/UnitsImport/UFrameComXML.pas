unit UFrameComXML;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, sFrameAdapter, Buttons, StdCtrls, sLabel, Mask, sMaskEdit, 
  sCustomComboEdit, sTooledit, UPrincipal, sSpeedButton;

type
  TTFrameComXML = class(TFrame)
    sFrameAdapter1: TsFrameAdapter;
    CaminhoArquivo: TsFilenameEdit;
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
  UImportXML;
{$R *.dfm}

procedure TTFrameComXML.GerarButton1Click(Sender: TObject);
begin 
  if FileExists(CaminhoArquivo.Text) then
  begin 
    if ImportXML = nil then
    begin 
      ImportXML := TImportXML.Create(nil);
      ImportXML.Arquivo1.Text := CaminhoArquivo.Text;
      ImportXML.Show;
      PrincipalXML.Close;
    end;
  end;
end;

end.
