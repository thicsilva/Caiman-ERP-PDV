unit UQRelExtratoFor;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, QRExport, UNovosComponentes, UNovoFormulario;

type
  TFrmQRelExtratoFor = class(UNovoFormulario.TForm)
    QRFor: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
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
    QRLFor: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText11: TQRDBText;
    SummaryBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel17: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelExtratoFor: TFrmQRelExtratoFor;

implementation
Uses URelExtratoFor;

{$R *.dfm}

procedure TFrmQRelExtratoFor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

end.
