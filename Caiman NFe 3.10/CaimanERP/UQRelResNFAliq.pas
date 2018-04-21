unit UQRelResNFAliq;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, QRExport, UNovosComponentes, UNovoFormulario;

type
  TFrmQRelResNFAliq = class(UNovoFormulario.TForm)
    QRResumo: TQuickRep;
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
    QRLabel4: TQRLabel;
    QRExpr1: TQRExpr;
    QRGroup1: TQRGroup;
    QRDBText4: TQRDBText;
    QRLabel8: TQRLabel;
    QRBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr2: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelResNFAliq: TFrmQRelResNFAliq;

implementation
Uses URelResumoMapa;

{$R *.dfm}

end.
