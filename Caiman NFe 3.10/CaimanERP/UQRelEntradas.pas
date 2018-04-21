unit UQRelEntradas;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, QRExport, UNovosComponentes, UNovoFormulario;

type
  TFrmQRelEntradas = class(UNovoFormulario.TForm)
    QREnt: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
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
    QRLabel8: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel4: TQRLabel;
    QRExpr1: TQRExpr;
    SummaryBand1: TQRBand;
    QRLabel12: TQRLabel;
    QRExpr2: TQRExpr;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelEntradas: TFrmQRelEntradas;

implementation
Uses URelEntradas;

{$R *.dfm}

procedure TFrmQRelEntradas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
   Action:= caFree;
end;

end.
