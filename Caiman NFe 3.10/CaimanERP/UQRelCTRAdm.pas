unit UQRelCTRAdm;

interface

uses
  Windows,  Messages, SysUtils, Variants, Classes, Graphics, Controls,  Forms, 
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, UNovosComponentes, UNovoFormulario;

type
  TFrmQRelCTRAdm = class(UNovoFormulario.TForm)
    QRCTRAdm: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
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
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel15: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText7: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQRelCTRAdm: TFrmQRelCTRAdm;

implementation
Uses URelContasReceberCartao;

{$R *.dfm}

end.
