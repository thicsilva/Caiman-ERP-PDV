unit UKRelEtiquetas;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, UNovosComponentes, UNovoFormulario;

type
  TfrmKRelEtiquetas = class(UNovoFormulario.TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRBand3: TQRBand;
    QRShape1: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel3: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKRelEtiquetas: TfrmKRelEtiquetas;

implementation

uses
   URelEtiqueta;

{$R *.dfm}

end.
