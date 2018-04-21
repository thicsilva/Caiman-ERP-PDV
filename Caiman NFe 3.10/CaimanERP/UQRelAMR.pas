unit UQRelAMR;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, QRExport, UNovosComponentes, UNovoFormulario;

type
  TFrmQRelAMR = class(UNovoFormulario.TForm)
    QRAMR: TQuickRep;
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
    QRLabel7: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel8: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel9: TQRLabel;
    QRLTotal: TQRLabel;
    QRLabel4: TQRLabel;
    QRLVendas: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelAMR: TFrmQRelAMR;

implementation
Uses URelAMR;

{$R *.dfm}

end.
