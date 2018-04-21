unit UQRelOutrasEntradas;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, QRExport, UNovosComponentes, UNovoFormulario;

type
  TFrmQRelOutrasEntradas = class(UNovoFormulario.TForm)
    QROE: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRLNomeEmpresa: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRSysData3: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLTitulo: TQRLabel;
    QRShape1: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel4: TQRLabel;
    QRLFor: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRBand1: TQRBand;
    QRLabel7: TQRLabel;
    QRExpr1: TQRExpr;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelOutrasEntradas: TFrmQRelOutrasEntradas;

implementation
Uses URelOutrasEntradas;

{$R *.dfm}

procedure TFrmQRelOutrasEntradas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

end.
