unit UQRelRegEntradas;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, QRExport, UNovosComponentes, UNovoFormulario;

type
  TFrmQRelRegEntradas = class(UNovoFormulario.TForm)
    QRRegEntradas: TQuickRep;
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
    QRLabel7: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText11: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelRegEntradas: TFrmQRelRegEntradas;

implementation
Uses URelRegEntradas;

{$R *.dfm}

end.
