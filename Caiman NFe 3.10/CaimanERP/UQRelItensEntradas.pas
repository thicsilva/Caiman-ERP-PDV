unit UQRelItensEntradas;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, QRExport, UNovosComponentes, UNovoFormulario;

type
  TFrmQRelItensEntradas = class(UNovoFormulario.TForm)
    QREnt: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
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
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel7: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel12: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelItensEntradas: TFrmQRelItensEntradas;

implementation
Uses URelEntradas;

{$R *.dfm}

end.
