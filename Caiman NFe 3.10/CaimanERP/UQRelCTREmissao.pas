unit UQRelCTREmissao;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, QRExport, UNovosComponentes, UNovoFormulario;

type
  TFrmQRelCTREmitidas = class(UNovoFormulario.TForm)
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
    QRLTitulo: TQRLabel;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel15: TQRLabel;
    QRExpr1: TQRExpr;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelCTREmitidas: TFrmQRelCTREmitidas;

implementation
Uses URelCTREmitidas;

{$R *.dfm}

end.
