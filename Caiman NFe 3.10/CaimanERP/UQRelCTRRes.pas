unit UQRelCTRRes;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, QRExport, UNovosComponentes, UNovoFormulario;

type
  TFrmQRelCTRRes = class(UNovoFormulario.TForm)
    QRRec: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText8: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRLNomeEmpresa: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRSysData3: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRTitulo: TQRLabel;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel12: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel15: TQRLabel;
    QRExpr1: TQRExpr;
    QRLVend: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelCTRRes: TFrmQRelCTRRes;

implementation
Uses URelCTRRes;

{$R *.dfm}

procedure TFrmQRelCTRRes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;


end.
