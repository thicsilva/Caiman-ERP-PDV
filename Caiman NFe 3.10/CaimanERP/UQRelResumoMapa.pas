unit UQRelResumoMapa;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, QRExport, UNovosComponentes, UNovoFormulario;

type
  TFrmQRelResumoMapa = class(UNovoFormulario.TForm)
    QRResumo: TQuickRep;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRLNomeEmpresa: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRSysData3: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLTitulo: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText1: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel5: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel6: TQRLabel;
    QRExpr3: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelResumoMapa: TFrmQRelResumoMapa;

implementation
Uses URelResumoMapa;

{$R *.dfm}

end.
